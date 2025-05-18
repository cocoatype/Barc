//  Created by Geoff Pado on 5/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Synchronization

import BarcLogging
import BarcTestHelpersInterface

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

    private let expectationMutex = Mutex<Expectation?>(nil)
    public var logExpectation: Expectation? {
        get {
            return expectationMutex.withLock { $0 }
        }
        set {
            expectationMutex.withLock { $0 = newValue }
        }
    }
    public func log(_ event: Event) {
        loggedEvents.append(event)
        logExpectation?.fulfill()
    }
}
