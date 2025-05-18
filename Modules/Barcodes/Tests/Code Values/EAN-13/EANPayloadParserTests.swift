//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcBarcodes

struct EANPayloadParserTests {
    @Test func parserThrowsForInvalidValue() throws {
        let error = #expect(throws: EANPayloadParseError.self) {
            _ = try EANPayloadParser().payload(for: "hi")
        }

        guard case .invalidBarcodeValue(let value) = error else {
            Issue.record("Unexpected error value: \(String(describing: error))"); return
        }

        #expect(value == "hi")
    }
}
