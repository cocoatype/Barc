//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandlingDoubles
import TestHelpers
import XCTest

final class StubErrorHandlerTests: XCTestCase {
    func testFatalErrorExpectation() {
        let expectation = expectation(description: "fatal error behavior replaced")
        let handler = StubErrorHandler(fatalErrorExpectation: expectation)

        DispatchQueue.global(qos: .userInitiated).async {
            handler.fatalError("Hello, fatalError!")
        }

        waitForExpectations(timeout: 1)
    }
}
