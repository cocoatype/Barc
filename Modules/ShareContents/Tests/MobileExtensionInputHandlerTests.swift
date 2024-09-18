//  Created by Geoff Pado on 9/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PersistenceDoubles
import PurchasingDoubles
import TestHelpers
import XCTest

@testable import ShareContents

class MobileExtensionInputHandlerTests: XCTestCase {
    func testInitCausesPurchaseRepositoryInitialize() {
        StubPurchaseRepository.initializeExpectation = expectation(description: "initialize called")
        let _ = MobileExtensionInputHandler(
            barcodeRepository: StubBarcodeRepository(),
            purchaseRepository: StubPurchaseRepository()
        )

        waitForExpectations(timeout: 1)
    }

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
