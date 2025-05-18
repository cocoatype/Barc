//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcBarcodes

struct Code128ValueToStringConverterTests {
    @Test func valueConversionModeA() throws {
        let payload = Code128CodeValue.Payload(elements: [.e67, .e36, .e21, .e2c, .e35, .e25, .e20, .e6a])
        let value = Code128CodeValue(payload: payload)
        let converter = Code128ValueToStringConverter()
        try #expect(converter.string(from: value) == "VALUE")
    }

    @Test func valueConversionModeB() throws {
        let payload = Code128CodeValue.Payload(elements: [.e68, .e36, .e41, .e4c, .e55, .e45, .e44, .e6a])
        let value = Code128CodeValue(payload: payload)
        let converter = Code128ValueToStringConverter()
        try #expect(converter.string(from: value) == "Value")
    }
}
