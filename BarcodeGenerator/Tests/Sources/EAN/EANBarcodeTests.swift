//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import BarcodeGenerator
@testable import ErrorHandling

final class EANBarcodeTests: XCTestCase {
    func testInitFatalErrorsForInvalidValue() {
        let expectation = expectation(description: "fatalError")

        ErrorHandling.overwriteFatalError { message, file, _ in
            XCTAssertEqual(message, "invalidBarcodeValue(\"42\")")
            expectation.fulfill()
            ErrorHandling.hangForever()
        }

        DispatchQueue.global(qos: .userInitiated).async {
            _ = EANBarcode(value: "42")
        }

        waitForExpectations(timeout: 1)
    }
}
