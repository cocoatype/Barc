//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import OSLog
import TelemetryClient

struct TelemetryLogger: Logger {
    private static func initializeTelemetry() {
        guard TelemetryManager.isInitialized == false else { return }
        let configuration = TelemetryManagerConfiguration(appID: "7885E54D-8730-4C58-A3FA-390D008CCBAF")
        TelemetryDeck.initialize(config: configuration)
    }

    private let manager: TelemetrySending
    init(manager: TelemetrySending) {
        self.manager = manager
    }

    init() {
        Self.initializeTelemetry()
        self.init(manager: TelemetryManager.shared)
    }

    func log(_ event: Event) {
        os_log("TelemetryLogger logged: %{public}@ (%{public}@)", event.value, event.info)
        manager.send(event.value, for: nil, floatValue: nil, with: event.info)
    }
}
