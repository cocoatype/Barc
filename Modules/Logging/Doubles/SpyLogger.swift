//  Created by Geoff Pado on 5/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Synchronization
import TestHelpersInterface

import BarcLogging

@available(iOS 18.0, *)
public final class SpyLogger: Logger {
    public init(
        logExpectation: Expectation? = nil
    ) {
        self.logExpectation = logExpectation
    }

    private let loggedEventsMutex = Mutex([Event]())
    public var loggedEvents: [Event] {
        get {
            return loggedEventsMutex.withLock { $0 }
        }
        set {
            loggedEventsMutex.withLock { $0 = newValue }
        }
    }

    public let logExpectation: Expectation?
    public func log(_ event: Event) {
        loggedEvents.append(event)
    }
}
