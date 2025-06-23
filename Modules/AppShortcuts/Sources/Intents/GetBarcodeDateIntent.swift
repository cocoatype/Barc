//  Created by Geoff Pado on 6/22/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppIntents

import BarcShortcutsModels

struct GetBarcodeDateIntent: AppIntent {
    static let title: LocalizedStringResource = "GetBarcodeDateIntent.title"

    static let description: IntentDescription = "GetBarcodeDateIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("GetBarcodeDateIntent.parameterSummary\(\.$code)")
    }

    @Parameter(
        title: "GetBarcodeDateIntent.code"
    )
    var code: BarcodeEntity

    func perform() -> some IntentResult & ReturnsValue<Date?> {
        return .result(value: code.code.date)
    }
}


