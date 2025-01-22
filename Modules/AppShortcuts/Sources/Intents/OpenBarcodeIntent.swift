//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Navigation
import ShortcutsModels

struct OpenCodeIntent: OpenIntent {
    static let title: LocalizedStringResource = "OpenCodeIntent.title"

    static let description: IntentDescription = "OpenCodeIntent.description"

    static let openAppWhenRun = true

    static var parameterSummary: some ParameterSummary {
        Summary("OpenCodeIntent.parameterSummary\(\.$target)")
    }

    @AppDependency private var navigator: Navigator

    @Parameter(
        title: "OpenCodeIntent.code.title"
    )
    public var target: BarcodeEntity

    public func perform() async throws -> some IntentResult {
        await MainActor.run {
            navigator.navigate(to: .barcodeDetails(target.code))
        }

        return .result()
    }
}
