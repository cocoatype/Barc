//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import Barcodes

class Code39PayloadParserTests: XCTestCase {
    func testAddsPrefixStartElement() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "123*")

        XCTAssertEqual(result.elements, [.startStop, .e01, .e02, .e03, .startStop])
    }

    func testAddsSuffixStopElement() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "*123")

        XCTAssertEqual(result.elements, [.startStop, .e01, .e02, .e03, .startStop])
    }

    func testAddsBothStartAndStopElements() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "123")

        XCTAssertEqual(result.elements, [.startStop, .e01, .e02, .e03, .startStop])
    }

    func testAddsBothStartAndStopElementsToEmptyString() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "")

        XCTAssertEqual(result.elements, [.startStop, .startStop])
    }
}
