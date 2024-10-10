//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import Barcodes

class Code128PayloadParserTests: XCTestCase {
    func testParsingTextModeB() throws {
        let parser = Code128PayloadParser()
        let payload = try parser.payload(for: "Value")
        XCTAssertEqual(payload.elements, [.e68, .e36, .e41, .e4c, .e55, .e45, .e44, .e6a])
    }
}
