//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import BarcBarcodes
import BarcLocation

public struct TriggerSensor {
    public init() {}

    public func isCodeTriggered(
        _ code: Code,
        location: Location?,
        date: Date
    ) -> Bool {
        if isCodeTriggered(code, date: date) {
            return true
        } else if let location {
            return isCodeTriggered(code, location: location)
        } else { return false }
    }

    private static let locationSensitivity = 91.44 // 1 American Football Field 🇺🇸
    private func isCodeTriggered(_ code: Code, location: Location) -> Bool {
        return code.locations.contains { codeLocation in
            codeLocation.distanceInMeters(to: location) < Self.locationSensitivity
        }
    }

    private static let dateSensitivity: TimeInterval = 3600 // 1 hour
    private func isCodeTriggered(_ code: Code, date: Date) -> Bool {
        return code.dates.contains { codeDate in
            abs(date.timeIntervalSince(codeDate)) < Self.dateSensitivity
        }
    }
}
