//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import TelemetryClient
import XCTest

@testable import BarcLogging

final class TelemetryLoggerTests: XCTestCase {
    func testBareInitInitializesTelemetryManager() {
        XCTAssertFalse(TelemetryManager.isInitialized)

        _ = TelemetryLogger()

        XCTAssertTrue(TelemetryManager.isInitialized)
    }

    func testLogSendsEventNameAndInfo() throws {
        let spy = SpySender()
        let logger = TelemetryLogger(manager: spy)

        logger.log(Event(name: "test", info: ["key": "value"]))

        let spyName = try XCTUnwrap(spy.name)
        let spyInfo = try XCTUnwrap(spy.info)
        XCTAssertEqual(spyName, "test")
        XCTAssertEqual(spyInfo, ["key": "value"])
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
