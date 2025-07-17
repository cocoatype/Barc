//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcBarcodes

struct Code128PayloadParserTests {
    @Test func parsingTextModeB() throws {
        let parser = Code128PayloadParser()
        let payload = try parser.payload(for: "Value")
        #expect(payload.elements == [.e68, .e36, .e41, .e4c, .e55, .e45, .e44, .e6a])
    }

    @Test func parsingNumericModeC() throws {
        let parser = Code128PayloadParser()
        let payload = try parser.payload(for: "123456")
        #expect(payload.elements == [.e69, .e0c, .e22, .e38, .e2c, .e6a])
    }
}
