//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

import BarcPersistenceDoubles

@testable import BarcAppShortcuts

@MainActor @Suite(.container)
struct CreateBarcodeIntentTests {
    private typealias IntentStrings = BarcAppShortcuts.Strings.CreateBarcodeIntent
    @Test(arguments: [
        (String?.none, IntentStrings.defaultName),
        ("", IntentStrings.defaultName),
        ("Test", "Test"),
    ])
    func codeName(parameterName: String?, expectedName: String) async throws {
        let repository = SpyBarcodeRepository()
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { repository }
        let intent = CreateBarcodeIntent()
        intent.format = .ean13
        intent.value = "444444444444"
        intent.name = parameterName

        _ = try await intent.perform()

        let code = try #require(repository.codes.first)
        #expect(code.name == expectedName)
    }
}
