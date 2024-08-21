//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Navigation

struct OpenCodeIntent: AppIntent {
    static let title: LocalizedStringResource = "OpenCodeIntent.title"

    static let description: IntentDescription = "OpenCodeIntent.description"

    static let openAppWhenRun = true

    static var parameterSummary: some ParameterSummary {
        Summary("OpenCodeIntent.parameterSummary\(\.$code)")
    }

    @AppDependency private var navigator: Navigator

    @Parameter(
        title: "OpenCodeIntent.code.title",
        inputConnectionBehavior: .default
    )
    var code: BarcodeEntity

    func perform() async throws -> some IntentResult {
        await MainActor.run {
            navigator.navigate(to: .barcodeDetails(code.code))
        }

        return .result()
    }
}
