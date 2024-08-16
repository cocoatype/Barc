//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import Barcodes

class EANPayloadParserTests: XCTestCase {
    func testParserThrowsForInvalidValue() throws {
        do {
            _ = try EANPayloadParser().payload(for: "hi")
        } catch EANPayloadParseError.invalidBarcodeValue(let invalidValue) {
            XCTAssertEqual(invalidValue, "hi")
        }
    }
}
