//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import ImageIO
import ImageReader
import SwiftUI
import UniformTypeIdentifiers

struct ShareView: View {
    @Environment(\.extensionContext) private var extensionContext
    @State private var viewState = ViewState.loading

    private let errorHandler: any ErrorHandler
    private let imageReader = ImageReader()
    init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        Group {
            switch viewState {
            case .loading:
                Text("Loading…")
            case .success(let code):
                Text("Success!")
            case .error(let error):
                let _ = errorHandler.log(error, module: "com.cocoatype.Barc.Share", type: "ShareView")
                Text(String(describing: error))
            }
        }
        .task {
            do {
                guard let extensionContext else {
                    throw ShareError.noExtensionContext
                }

                let inputProviders = extensionContext.extensionItems.compactMap(\.attachments).flatMap({ $0 })
                guard inputProviders.count > 0 else {
                    throw ShareError.noInputProviders
                }

                let imageProviders = inputProviders.filter { inputProvider in
                    inputProvider.canLoadObject(ofClass: UIImage.self)
                }
                guard let imageProvider = imageProviders.first else {
                    throw ShareError.noImageProviders
                }

                let data = try await imageProvider.loadData(for: .image)
                guard let cgImage = CGImage.image(from: data) else { throw ShareError.cannotCreateImageFromData }
                guard let codeValue = try await imageReader.codeValue(in: cgImage) else { throw ShareError.noCodeInImage }

                viewState = .success(codeValue)
            } catch {
                viewState = .error(error)
            }
        }
    }

    enum ViewState {
        case loading
        case success(CodeValue)
        case error(Error)
    }
}

extension CGImage {
    static func image(from data: Data) -> CGImage? {
        guard let dataProvider = CGDataProvider(data: data as CFData),
              let imageSource = CGImageSourceCreateWithDataProvider(dataProvider, nil)
        else { return nil }

        return CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
    }
}

extension NSItemProvider {
//    func loadObject<ObjectType>(ofClass readingClass: ObjectType.Type) async throws -> ObjectType where ObjectType: _ObjectiveCBridgeable, ObjectType._ObjectiveCType: NSItemProviderReading {
//        return try await withCheckedThrowingContinuation { continuation in
//            _ = loadObject(ofClass: readingClass) { object, error in
//                if let object {
//                    continuation.resume(returning: object)
//                } else if let error {
//                    continuation.resume(throwing: error)
//                } else {
//                    continuation.resume(throwing: ShareError.cannotLoadObject)
//                }
//            }
//        }
//    }

    func loadData(for uniformType: UTType) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            _ = loadDataRepresentation(for: uniformType) { data, error in
                if let data {
                    continuation.resume(returning: data)
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: ShareError.cannotLoadData)
                }
            }
        }
    }
}

extension NSExtensionContext {
    var extensionItems: [NSExtensionItem] {
        inputItems.compactMap { $0 as? NSExtensionItem }
    }
}

enum ShareError: Error {
    case cannotCreateImageFromData
    case cannotLoadData
    case noCodeInImage
    case noExtensionContext
    case noImageProviders
    case noInputProviders
}
