//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import PersistenceDoubles
import ReviewRequest
import TestHelpersInterface
import TestHelpers
import XCTest

class ReviewRequesterTests: XCTestCase {
    static let sampleCode = Code(name: "Name", value: .qr(value: "", correctionLevel: .m), location: nil, date: nil)
    struct SpyRequestReviewAction: RequestReviewAction {
        private var requestExpectation: Expectation?
        init(requestExpectation: Expectation? = nil) {
            self.requestExpectation = requestExpectation
        }

        func callAsFunction() {
            requestExpectation?.fulfill()
        }
    }

    @MainActor
    func testReviewRequestedFor3Codes() throws {
        var repository = StubBarcodeRepository()
        repository.codes = Array(repeating: Self.sampleCode, count: 3)

        let requestExpectation = expectation(description: "review requested")
        let spyAction = SpyRequestReviewAction(requestExpectation: requestExpectation)
        let requester = ReviewRequester(action: spyAction, repository: repository)

        try requester.requestReviewIfNeeded()
        waitForExpectations(timeout: 1)
    }

    @MainActor
    func testReviewNotRequestedFor4Codes() throws {
        var repository = StubBarcodeRepository()
        repository.codes = Array(repeating: Self.sampleCode, count: 4)

        let requestExpectation = expectation(description: "review requested")
        requestExpectation.isInverted = true
        let spyAction = SpyRequestReviewAction(requestExpectation: requestExpectation)
        let requester = ReviewRequester(action: spyAction, repository: repository)

        try requester.requestReviewIfNeeded()
        waitForExpectations(timeout: 0.01)
    }

    @MainActor
    func testReviewRequestedFor9Codes() throws {
        var repository = StubBarcodeRepository()
        repository.codes = Array(repeating: Self.sampleCode, count: 9)

        let requestExpectation = expectation(description: "review requested")
        let spyAction = SpyRequestReviewAction(requestExpectation: requestExpectation)
        let requester = ReviewRequester(action: spyAction, repository: repository)

        try requester.requestReviewIfNeeded()
        waitForExpectations(timeout: 1)
    }
}
