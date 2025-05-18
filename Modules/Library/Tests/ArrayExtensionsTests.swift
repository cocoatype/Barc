//  Created by Geoff Pado on 08/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcLibrary

struct ArrayExtensionsTests {
    @Test func minIndexWithMixedValues() {
        let array: [Double] = [1, 0, 3]
        #expect(array.minIndex == 1)
    }

    @Test func minIndexWithEqualValues() {
        let array: [Double] = [1, 0, 0]
        #expect(array.minIndex == 1)
    }

    @Test func minIndexWithRisingValues() {
        let array: [Double] = [1, 2, 3]
        #expect(array.minIndex == 0)
    }

    @Test func minIndexWithEmptyValues() {
        let array: [Double] = []
        #expect(array.minIndex == array.startIndex)
    }
}
