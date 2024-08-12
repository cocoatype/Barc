//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import ErrorHandling

final class FatalErrorTests: XCTestCase {
    func testOverwritingFatalErrorBehavior() {
        let expectation = expectation(description: "fatal error behavior replaced")

        ErrorHandling.overwriteFatalError { message, file, _ in
            XCTAssertEqual(message, "Hello, fatalError!")
            expectation.fulfill()
            ErrorHandling.hangForever()
        }

        DispatchQueue.global(qos: .userInitiated).async {
            ErrorHandling.fatalError("Hello, fatalError!")
        }

        waitForExpectations(timeout: 1)
    }
}
