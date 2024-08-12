//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import BarcodeGenerator

final class BarcodeValueTests: XCTestCase {
    func testInitThrowsForInvalidValue() throws {
        do {
            _ = try EANValue("hi")
        } catch BarcodeValueError.invalidBarcodeValue(let invalidValue) {
            XCTAssertEqual(invalidValue, "hi")
        }
    }

    func testEncodedValue() throws {
        let value = try EANValue("449029480255")

        try XCTAssertEqual(value.encodedValue, [
            true, false, true, // start
            false, true, false, false, false, true, true, // 4
            false, true, false, false, false, true, true, // 4
            false, false, false, true, false, true, true, // 9
            false, false, false, true, true, false, true, // 0
            false, false, true, false, false, true, true, // 2
            false, false, false, true, false, true, true, // 9
            false, true, false, true, false, // middle
            true, false, true, true, true, false, false, // 4
            true, false, false, true, false, false, false, // 8
            true, true, true, false, false, true, false, // 0
            true, true, false, true, true, false, false, // 2
            true, false, false, true, true, true, false, // 5
            true, false, false, true, true, true, false, // 5
            true, false, true, // end
        ])
    }
}
