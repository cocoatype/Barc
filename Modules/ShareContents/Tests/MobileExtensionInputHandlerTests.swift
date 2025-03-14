//  Created by Geoff Pado on 9/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import TestHelpers
import XCTest

import BarcPersistenceDoubles
import BarcPurchasingDoubles

@testable import BarcShareContents

class MobileExtensionInputHandlerTests: XCTestCase {
    @MainActor
    func testHandleInputWithNoExtensionContextThrows() async throws {
        var barcodeRepository = StubBarcodeRepository()
        barcodeRepository.codes = []

        let handler = MobileExtensionInputHandler(
            barcodeRepository: barcodeRepository,
            purchaseRepository: StubPurchaseRepository()
        )

        do {
            _ = try await handler.handleInput(from: nil)
            XCTFail("Expected error")
        } catch ShareError.noExtensionContext {}
    }
}
