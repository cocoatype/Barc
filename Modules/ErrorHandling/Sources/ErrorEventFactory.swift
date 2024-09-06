//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Logging

struct EventFactory {
    func event(from error: Error, module: StaticString, type: StaticString) -> Event {
        let errorID: String
        if Swift.type(of: error) is NSError.Type {
            let nsError = error as NSError
            errorID = "\(nsError.domain) - \(nsError.code)"
        } else {
            errorID = String(describing: error)
        }

        return Event(
            name: Self.logError,
            info: [
                Self.telemetryErrorIDKey: errorID,
                Self.errorModuleKey: String(module),
                Self.errorTypeKey: String(type),
                Self.errorDescriptionKey: error.localizedDescription
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
    private static let errorModuleKey = "Barc.Error.module"
    private static let errorTypeKey = "Barc.Error.type"
    private static let errorDescriptionKey = "Barc.Error.description"
}
