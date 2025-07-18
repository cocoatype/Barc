//  Created by Geoff Pado on 9/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcImageReader

@main
struct CodeScannerApp: App {
    @State private var text = "Hello, world!"

    var body: some Scene {
        WindowGroup {
            ZStack {
                Rectangle().fill(Color.clear)
                Text(text)
            }
                .dropDestination(for: Data.self) { items, location in
                    guard let imageData = items.first else { fatalError("No data") }
                    let image = CGImage.image(from: imageData)
                    Task {
                        do {
                            let value = try await reader.codeValue(in: image)
                            text = try description(for: value)
                        } catch {
                            text = String(describing: error)
                        }
                    }

                    return true
                }
        }
    }

    private func barcodeType(for codeValue: CodeValue?) -> String {
        guard let codeValue else { return "(null)" }
        return switch codeValue {
        case .code128: "Code 128"
        case .code39: "Code 39"
        case .codabar: "Codabar"
        case .ean: "EAN-13"
        case .itf: "ITF"
        case .pdf417: "PDF 417"
        case .qr: "QR"
        }
    }

    private func description(for codeValue: CodeValue?) throws -> String {
        guard let codeValue else { return "(null)" }
        return try "\(barcodeType(for: codeValue)): \(codeValue.stringRepresentation)"
    }

    private let reader = ImageReader()
}

extension CGImage {
    static func image(from data: Data) -> CGImage {
        if let dataProvider = CGDataProvider(data: data as CFData),
           let imageSource = CGImageSourceCreateWithDataProvider(dataProvider, nil),
           let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) {
            return cgImage
        } else { fatalError("Not an image") }
    }
}
