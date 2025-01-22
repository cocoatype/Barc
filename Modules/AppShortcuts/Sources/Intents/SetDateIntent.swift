//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Barcodes
import CoreLocation
import ErrorHandling
import Persistence
import ShortcutsModels

struct SetDateIntent: AppIntent {
    static let title: LocalizedStringResource = "SetDateIntent.title"
    static let description: IntentDescription = "SetDateIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("SetDateIntent.parameterSummary\(\.$code)\(\.$date)")
    }

    @Parameter(
        title: "SetDateIntent.code"
    )
    var code: BarcodeEntity

    @Parameter(
        title: "SetDateIntent.date"
    )
    var date: Date

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity> {
        let existingCode = code.code
        let newCode = Code(name: existingCode.name, value: existingCode.value, location: existingCode.location, date: date)

        let repository = Persistence.guardLetNotIsScrollingDoesNotEqual
        try repository.update(newCode)
        ShortcutsProvider.updateAppShortcutParameters()

        return .result(value: BarcodeEntity(code: newCode, errorHandler: ErrorHandling.defaultHandler))
    }
}
