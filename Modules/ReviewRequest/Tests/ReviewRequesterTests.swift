//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

import BarcBarcodes
import BarcPersistenceDoubles
import BarcReviewRequest
import BarcTestHelpersInterface
import BarcTestHelpers

@MainActor
@Suite(.container)
struct ReviewRequesterTests {
    static let sampleCode = Code(name: "Name", value: .qr(value: "", correctionLevel: .m), location: nil, date: nil)
    struct SpyRequestReviewAction: RequestReviewAction {
        private var confirmation: Confirmation
        init(confirmation: Confirmation) {
            self.confirmation = confirmation
        }

        func callAsFunction() {
            confirmation()
        }
    }

    @Test
    func reviewRequestedFor3Codes() async throws {
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in
            var repository = StubBarcodeRepository()
            repository.codes = Array(repeating: Self.sampleCode, count: 3)
            return repository
        }

        try await confirmation { reviewRequested in
            let spyAction = SpyRequestReviewAction(confirmation: reviewRequested)
            let requester = ReviewRequester(action: spyAction)
            try requester.requestReviewIfNeeded()
        }
    }

    @Test
    func reviewNotRequestedFor4Codes() async throws {
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in
            var repository = StubBarcodeRepository()
            repository.codes = Array(repeating: Self.sampleCode, count: 4)
            return repository
        }

        try await confirmation(expectedCount: 0) { reviewRequested in
            let spyAction = SpyRequestReviewAction(confirmation: reviewRequested)
            let requester = ReviewRequester(action: spyAction)
            try requester.requestReviewIfNeeded()
        }
    }

    @Test
    func reviewRequestedFor9Codes() async throws {
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in
            var repository = StubBarcodeRepository()
            repository.codes = Array(repeating: Self.sampleCode, count: 9)
            return repository
        }

        try await confirmation { reviewRequested in
            let spyAction = SpyRequestReviewAction(confirmation: reviewRequested)
            let requester = ReviewRequester(action: spyAction)
            try requester.requestReviewIfNeeded()
        }
    }
}
