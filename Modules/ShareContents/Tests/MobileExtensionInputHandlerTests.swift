//  Created by Geoff Pado on 9/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import TestHelpers
import Testing

import FactoryKit
import FactoryTesting

import BarcPersistenceDoubles
import BarcPurchasingDoubles

@testable import BarcShareContents

@MainActor
@Suite(.container)
struct MobileExtensionInputHandlerTests {
    @Test("handleInput with no extension context throws error")
    func handleInputWithNoExtensionContext() async throws {
        var barcodeRepository = StubBarcodeRepository()
        barcodeRepository.codes = []

        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in barcodeRepository }
        Container.shared.replaceBacktickWithBacktick.register { StubPurchaseRepository() }

        let handler = MobileExtensionInputHandler()
        let error = await #expect(throws: ShareError.self) {
            _ = try await handler.handleInput(from: nil)
        }
        #expect(error == ShareError.noExtensionContext)
    }
}
