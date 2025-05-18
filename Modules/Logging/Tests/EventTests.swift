//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcLogging

struct EventTests {
    @Test func nameInitWithValue() {
        let event = Event(
            name: Event.Name("static"),
            info: [:]
        )

        #expect(event.value == "static")
    }

    @Test func nameInitWithLiteral() {
        let event = Event(
            name: "literal",
            info: [:]
        )

        #expect(event.value == "literal")
    }

    @Test func infoInit() {
        let event = Event(name: "", info: ["key": "value"])
        #expect(event.info == ["key": "value"])
    }
}
