//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

import BarcBarcodes
import BarcPersistence
import BarcPersistenceDoubles

@testable import BarcAppShortcuts

@MainActor @Suite(.container)
struct CreateBarcodeIntentTests {
    private typealias IntentStrings = BarcAppShortcuts.Strings.CreateBarcodeIntent
    @Test("Uses correct code name", arguments: [
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

    @Test("Throws error for duplicate when requested")
    func duplicateHandlingWithError() async throws {
        let repository = SpyBarcodeRepository()
        let originalValue = "https://cocoatype.com/"
        let originalCode = Code.qr(
            name: "Original Code",
            value: originalValue,
            correctionLevel: .m
        )
        try repository.add(originalCode)
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { repository }

        let intent = CreateBarcodeIntent()
        intent.format = .qr
        intent.value = originalValue
        intent.duplicateHandling = .showError

        let error = try await #require(throws: BarcodeRepositoryError.self) {
            try await intent.perform()
        }

        guard case .duplicateCode(let actualCode) = error else {
            Issue.record("Could not unwrap error"); return
        }

        #expect(actualCode == originalCode)
    }

    @Test("Returns original for duplicate when requested")
    func duplicateHandlingWithReturn() async throws {
        let repository = SpyBarcodeRepository()
        let originalValue = "https://cocoatype.com/"
        let originalCode = Code.qr(
            name: "Original Code",
            value: originalValue,
            correctionLevel: .m
        )
        try repository.add(originalCode)
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { repository }

        let intent = CreateBarcodeIntent()
        intent.format = .qr
        intent.value = originalValue
        intent.duplicateHandling = .returnOriginal

        let result = try await intent.perform()
        let actualCode = try #require(result.value?.code)

        #expect(actualCode == originalCode)
    }
}
