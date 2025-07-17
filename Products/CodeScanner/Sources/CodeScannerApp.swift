//  Created by Geoff Pado on 9/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcImageReader

@main
struct CodeScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Rectangle()
                Text("Hello, world!")
            }
                .dropDestination(for: Data.self) { items, location in
                    guard let imageData = items.first else { fatalError("No data") }
                    let image = CGImage.image(from: imageData)
                    Task {
                        do {
                            let value = try await reader.codeValue(in: image)
                            try dump(description(for: value))
                        } catch {
                            print(String(describing: error))
                        }
                    }

                    return true
                }
        }
    }

    private func description(for codeValue: CodeValue?) throws -> String {
        guard let codeValue else { return "(null)" }
        let barcodeType = switch codeValue {
        case .code128: "Code 128"
        case .code39: "Code 39"
        case .codabar: "Codabar"
        case .ean: "EAN-13"
        case .itf: "IFT"
        case .pdf417: "PDF 417"
        case .qr: "QR"
        }
        return try "\(barcodeType): \(codeValue.stringRepresentation)"
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
