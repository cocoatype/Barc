//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import TelemetryClient
import Testing

@testable import BarcLogging

struct TelemetryLoggerTests {
    @Test func bareInitInitializesTelemetryManager() {
        #expect(TelemetryManager.isInitialized == false)

        _ = TelemetryLogger()

        #expect(TelemetryManager.isInitialized == true)
    }

    @Test func logSendsEventNameAndInfo() throws {
        let spy = SpySender()
        let logger = TelemetryLogger(manager: spy)

        logger.log(Event(name: "test", info: ["key": "value"]))

        let spyName = try #require(spy.name)
        let spyInfo = try #require(spy.info)
        #expect(spyName == "test")
        #expect(spyInfo == ["key": "value"])
    }
}

private final class SpySender: TelemetrySending, @unchecked Sendable {
    var name: String?
    var info: [String: String]?

    func send(_ signalType: String, for clientUser: String?, floatValue: Double?, with additionalPayload: [String: String]) {
        name = signalType
        info = additionalPayload
    }
}
