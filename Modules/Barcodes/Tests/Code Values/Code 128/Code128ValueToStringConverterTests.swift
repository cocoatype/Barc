//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import Barcodes

class Code128ValueToStringConverterTests: XCTestCase {
    func testValueConversionModeA() throws {
        let payload = Code128CodeValue.Payload(elements: [.e67, .e36, .e21, .e2c, .e35, .e25, .e20, .e6a])
        let value = Code128CodeValue(payload: payload)
        let converter = Code128ValueToStringConverter()
        try XCTAssertEqual(converter.string(from: value), "VALUE")
    }

    func testValueConversionModeB() throws {
        let payload = Code128CodeValue.Payload(elements: [.e68, .e36, .e41, .e4c, .e55, .e45, .e44, .e6a])
        let value = Code128CodeValue(payload: payload)
        let converter = Code128ValueToStringConverter()
        try XCTAssertEqual(converter.string(from: value), "Value")
    }
}
