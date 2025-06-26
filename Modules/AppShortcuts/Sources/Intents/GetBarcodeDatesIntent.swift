//  Created by Geoff Pado on 6/22/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppIntents

import BarcShortcutsModels

struct GetBarcodeDatesIntent: AppIntent {
    static let title: LocalizedStringResource = "GetBarcodeDatesIntent.title"

    static let description: IntentDescription = "GetBarcodeDatesIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("GetBarcodeDatesIntent.parameterSummary\(\.$code)")
    }

    @Parameter(
        title: "GetBarcodeDatesIntent.code"
    )
    var code: BarcodeEntity

    func perform() -> some IntentResult & ReturnsValue<[Date]> {
        return .result(value: code.code.dates)
    }
}
