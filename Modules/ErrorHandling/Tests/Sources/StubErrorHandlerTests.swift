//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Testing

import BarcErrorHandlingDoubles
import BarcTestHelpers

struct StubErrorHandlerTests {
    @MainActor
    @Test func fatalErrorExpectation() async throws {
        try await confirmation { fatalErrorConfirmation in
            let handler = StubErrorHandler(fatalErrorExpectation: fatalErrorConfirmation)

            Task.detached {
                handler.fatalError("Hello, fatalError!")
            }

            try await Task.sleep(for: .milliseconds(100))
        }
    }
}
