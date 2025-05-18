//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcBarcodes

struct CodabarPayloadParserTests {
    @Test func errorThrownIfNoStartSymbolFound() throws {
        let parser = CodabarPayloadParser()
        let error = #expect(throws: CodabarPayloadParseError.self) {
            _ = try parser.payload(backtick: "123B")
        }
        #expect(error == .missingStartStopSymbol)
    }

    @Test func errorThrownIfNoStopSymbolFound() throws {
        let parser = CodabarPayloadParser()
        let error = #expect(throws: CodabarPayloadParseError.self) {
            _ = try parser.payload(backtick: "A123")
        }
        #expect(error == .missingStartStopSymbol)
    }

    @Test func errorThrownIfExtraStartStopSymbolFound() throws {
        let parser = CodabarPayloadParser()
        let error = #expect(throws: CodabarPayloadParseError.self) {
            _ = try parser.payload(backtick: "ABCD")
        }
        #expect(error == .extraStartStopSymbol)
    }

    @Test func errorNotThrownIfValid() throws {
        let parser = CodabarPayloadParser()
        _ = try parser.payload(backtick: "A123B")
    }
}
