//  Created by Geoff Pado on 11/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

struct GetBarcodeValueIntent: AppIntent {
    static let title: LocalizedStringResource = "GetBarcodeValueIntent.title"

    static let description: IntentDescription = "GetBarcodeValueIntent.title"

    static var parameterSummary: some ParameterSummary {
        Summary("GetBarcodeValueIntent.parameterSummary\(\.$code)")
    }

    @Parameter(
        title: "GetBarcodeValueIntent.code.title"
    )
    var code: BarcodeEntity

    func perform() async throws -> some IntentResult & ReturnsValue<String> {
        let result = code.code.value.id

        return .result(value: result)
    }
}
