//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import BarcodeGenerator
import SwiftUI
import UniformTypeIdentifiers

struct DisplayBarcodeIntent: AppIntent {
    static let title: LocalizedStringResource = "DisplayBarcodeIntent.title"
    static let description: IntentDescription = "DisplayBarcodeIntent.description"

    @Parameter(
        title: "DisplayBarcodeIntent.barcode.title"
    )
    var barcode: BarcodeEntity

    static var parameterSummary: some ParameterSummary {
        Summary("DisplayBarcodeIntent.parameterSummary\(\.$barcode)")
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<IntentFile> {
        let view = CodeRenderer(value: barcode.value).frame(width: 200, height: 200)
        let imageRenderer = ImageRenderer(content: view)
        guard let image = imageRenderer.cgImage else { throw DisplayBarcodeIntentError.cannotGenerateImage }

        let data = NSMutableData()
        guard let imageDestination = CGImageDestinationCreateWithData(data, UTType.png.identifier as CFString, 1, nil) else {
            throw DisplayBarcodeIntentError.cannotCreateImageDestination
        }

        CGImageDestinationAddImage(imageDestination, image, nil)
        CGImageDestinationFinalize(imageDestination)

        let file = IntentFile(data: data as Data, filename: "\(barcode.name).png")

        return .result(value: file)
    }
}

enum DisplayBarcodeIntentError: Error {
    case cannotCreateImageDestination
    case cannotGenerateImage
}
