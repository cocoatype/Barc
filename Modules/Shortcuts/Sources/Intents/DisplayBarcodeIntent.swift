//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import BarcodeGenerator
import SwiftUI
import UniformTypeIdentifiers

struct DisplayCodeIntent: AppIntent {
    static let title: LocalizedStringResource = "DisplayCodeIntent.title"
    static let description: IntentDescription = "DisplayCodeIntent.description"

    @Parameter(
        title: "DisplayCodeIntent.code.title"
    )
    var code: BarcodeEntity

    @Parameter(
        title: "DisplayCodeIntent.hasBackground.title",
        default: true
    )
    var hasBackground: Bool

    static var parameterSummary: some ParameterSummary {
        Summary("DisplayCodeIntent.parameterSummary\(\.$code)") {
            \.$hasBackground
        }
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<IntentFile> {
        let renderer = CodeImageRenderer()
        let imageData = try renderer.pngData(from: code.value, withBackground: hasBackground)
        let file = IntentFile(data: imageData, filename: code.name, type: .png)

        return .result(value: file)
    }
}
