//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Foundation
import TestHelpersInterface

public struct StubErrorHandler: ErrorHandler {
    public init(
        fatalErrorExpectation: (any Expectation)? = nil,
        logExpectation: (any Expectation)? = nil
    ) {
        self.fatalErrorExpectation = fatalErrorExpectation
        self.logExpectation = logExpectation
    }

    private let logExpectation: (any Expectation)?
    public func log(_ error: any Error) {
        logExpectation?.fulfill()
    }

    private let fatalErrorExpectation: (any Expectation)?
    public func fatalError(message: StaticString, file: StaticString, line: UInt) -> Never {
        fatalErrorExpectation?.fulfill()
        repeat {
            RunLoop.current.run()
        } while (true)
    }
}
