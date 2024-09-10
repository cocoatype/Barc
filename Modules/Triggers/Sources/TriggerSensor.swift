//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation
import Location

public struct TriggerSensor {
    public init() {}

//    func triggeredCodes(in codes: [Code], location: Location, date: Date) -> [Code] {
//        codes.filter {
//            isCodeTriggered($0, location: location, date: date)
//        }
//    }

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
        guard let codeLocation = code.location else { return false }

        return codeLocation.distanceInMeters(to: location) < Self.locationSensitivity
    }

    private static let dateSensitivity: TimeInterval = 3600 // 1 hour
    private func isCodeTriggered(_ code: Code, date: Date) -> Bool {
        guard let codeDate = code.date else { return false }
        return abs(date.timeIntervalSince(codeDate)) < Self.dateSensitivity
    }
}
