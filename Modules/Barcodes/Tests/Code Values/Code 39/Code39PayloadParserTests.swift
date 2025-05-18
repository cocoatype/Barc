//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcBarcodes

struct Code39PayloadParserTests {
    @Test func addsPrefixStartElement() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "123*")

        #expect(result.elements == [.startStop, .e01, .e02, .e03, .startStop])
    }

    @Test func addsSuffixStopElement() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "*123")

        #expect(result.elements == [.startStop, .e01, .e02, .e03, .startStop])
    }

    @Test func addsBothStartAndStopElements() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "123")

        #expect(result.elements == [.startStop, .e01, .e02, .e03, .startStop])
    }

    @Test func addsBothStartAndStopElementsToEmptyString() throws {
        let parser = Code39PayloadParser()
        let result = try parser.payload(for: "")

        #expect(result.elements == [.startStop, .startStop])
    }
}
