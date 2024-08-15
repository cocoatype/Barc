//  Created by Geoff Pado on 08/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import Library

class ArrayExtensionsTests: XCTestCase {
    func testMinIndexWithMixedValues() {
        let array: [Double] = [1, 0, 3]
        XCTAssertEqual(array.minIndex, 1)
    }

    func testMinIndexWithEqualValues() {
        let array: [Double] = [1, 0, 0]
        XCTAssertEqual(array.minIndex, 1)
    }

    func testMinIndexWithRisingValues() {
        let array: [Double] = [1, 2, 3]
        XCTAssertEqual(array.minIndex, 0)
    }

    func testMinIndexWithEmptyValues() {
        let array: [Double] = []
        XCTAssertEqual(array.minIndex, array.startIndex)
    }
}
