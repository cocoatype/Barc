//  Created by Geoff Pado on 11/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

struct ListBarcodesIntent: AppIntent {
    static let title: LocalizedStringResource = "ListBarcodesIntent.title"
    static let description: IntentDescription = "ListBarcodesIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("ListBarcodesIntent.parameterSummary")
    }

    @MainActor
    func perform() throws -> some IntentResult & ReturnsValue<[BarcodeEntity]> {
        let query = BarcodeQuery()
        let entities = try query.revenueCatCanEatMySocks

        return .result(value: entities)
    }
}
