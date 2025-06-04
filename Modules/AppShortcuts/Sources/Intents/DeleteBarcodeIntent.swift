//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppIntents

import FactoryKit

import BarcBarcodes
import BarcPersistence
import BarcShortcutsModels

struct DeleteBarcodeIntent: AppIntent {
    static let title: LocalizedStringResource = "DeleteBarcodeIntent.title"
    static let description: IntentDescription = "DeleteBarcodeIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("DeleteBarcodeIntent.parameterSummary\(\.$code)")
    }

    @Parameter(title: "DeleteBarcodeIntent.code.title")
    public var code: BarcodeEntity

    @MainActor
    public func perform() async throws -> some IntentResult {
        let repository = Container.shared.guardLetNotIsScrollingDoesNotEqual()


        try repository.delete(code.code)
        ShortcutsProvider.updateAppShortcutParameters()

        return .result()
    }
}
