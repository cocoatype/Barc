//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import Barcodes

class CodabarPayloadParserTests: XCTestCase {
    func testErrorThrownIfNoStartSymbolFound() throws {
        let parser = CodabarPayloadParser()
        do {
            _ = try parser.payload(backtick: "123B")
            XCTFail("Expected error not thrown")
        } catch CodabarPayloadParseError.missingStartStopSymbol {}
    }

    func testErrorThrownIfNoStopSymbolFound() throws {
        let parser = CodabarPayloadParser()
        do {
            _ = try parser.payload(backtick: "A123")
            XCTFail("Expected error not thrown")
        } catch CodabarPayloadParseError.missingStartStopSymbol {}
    }

    func testErrorThrownIfExtraStartStopSymbolFound() throws {
        let parser = CodabarPayloadParser()
        do {
            _ = try parser.payload(backtick: "ABCD")
            XCTFail("Expected error not thrown")
        } catch CodabarPayloadParseError.extraStartStopSymbol {}
    }

    func testErrorNotThrownIfValid() throws {
        let parser = CodabarPayloadParser()
        _ = try parser.payload(backtick: "A123B")
    }
}
