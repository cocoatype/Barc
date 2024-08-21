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

    @Parameter(
        title: "DisplayBarcodeIntent.hasBackground.title",
        default: true
    )
    var hasBackground: Bool

    static var parameterSummary: some ParameterSummary {
        Summary("DisplayBarcodeIntent.parameterSummary\(\.$barcode)") {
            \.$hasBackground
        }
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<IntentFile> {
        let renderer = CodeImageRenderer()
        let imageData = try renderer.pngData(from: barcode.value, withBackground: true)
        let file = IntentFile(data: imageData, filename: barcode.name, type: .png)

        return .result(value: file)
    }
}
