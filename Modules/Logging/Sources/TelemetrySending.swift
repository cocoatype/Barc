//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import TelemetryClient

protocol TelemetrySending: Sendable {
    func send(_ signalName: String, for clientUser: String?, floatValue: Double?, with additionalPayload: [String: String])
}

extension TelemetryManager: TelemetrySending {}
