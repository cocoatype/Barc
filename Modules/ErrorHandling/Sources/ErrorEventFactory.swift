//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Logging

struct EventFactory {
    func event(from error: Error) -> Event {
        let errorID: String
        if type(of: error) is NSError.Type {
            let nsError = error as NSError
            errorID = "\(nsError.domain) - \(nsError.code)"
        } else {
            errorID = String(describing: error)
        }

        return Event(
            name: Self.logError,
            info: [
                Self.telemetryErrorIDKey: errorID,
            ]
        )
    }

    func event(from message: StaticString) -> Event {
        Event(
            name: Event.Name(message),
            info: [:]
        )
    }

    // MARK: Event Names

    private static let logError = Event.Name("TelemetryDeck.Error.occurred")

    // MARK: Event Keys

    private static let telemetryErrorIDKey = "TelemetryDeck.Error.id"
}
