//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcBarcodes
@testable import BarcBarcodeGenerator

struct ITFEncoderTests {
    @Test func encodedValue() {
        let elements = [
            ITFElement.e0, .e1, .e2, .e3, .e4, .e5, .e6, .e7, .e8, .e9
        ]
        let payload = ITFCodeValue.Payload(elements: elements)
        let encoder = ITFEncoder()

        let encodedValue = encoder.encodedValue(from: payload)

        let expectedValue = [
            true, false, true, false, // start code
            true, false, false, false, true, false, true, true, true, false, true, true, true, false, true, false, false, false, // 0 1
            true, false, false, false, true, true, true, false, false, false, true, false, true, false, true, true, true, false, // 2 3
            true, false, false, false, true, false, true, true, true, false, false, false, true, false, true, true, true, false, // 4 5
            true, false, true, true, true, false, true, true, true, false, true, false, false, false, true, false, false, false, // 6 7
            true, true, true, false, true, false, false, false, true, false, true, true, true, false, false, false, true, false, // 8 9
            true, true, true, false, true, // stop code
        ]

        #expect(encodedValue == expectedValue)
    }
}
