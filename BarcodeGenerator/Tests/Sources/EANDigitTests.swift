//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import BarcodeGenerator

final class EANDigitTests: XCTestCase {
    func testInit() {
        let digit = EANDigit(l: 0b0000101, g: 0b1000100, r: 0b0000000, sectionMap: 0b010101)

        XCTAssertEqual(digit.l, [false, false, false, false, true, false, true])
        XCTAssertEqual(digit.g, [true, false, false, false, true, false, false])
        XCTAssertEqual(digit.r, [false, false, false, false, false, false, false])
        XCTAssertEqual(digit.sectionMap, [.l, .g, .l, .g, .l, .g])
    }
}
