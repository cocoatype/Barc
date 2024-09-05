//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import TelemetryClient

public struct TelemetryLogger: Logger {
    public static func initializeTelemetry() {
        guard TelemetryManager.isInitialized == false else { return }
        let configuration = TelemetryManagerConfiguration(appID: "7885E54D-8730-4C58-A3FA-390D008CCBAF")
        TelemetryManager.initialize(with: configuration)
    }

    private let manager: TelemetrySending
    init(manager: TelemetrySending) {
        self.manager = manager
    }

    public init() {
        Self.initializeTelemetry()
        self.init(manager: TelemetryManager.shared)
    }

    public func log(_ event: Event) {
        manager.send(event.value, for: nil, floatValue: nil, with: event.info)
    }
}
