//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import FactoryKit

import BarcErrorHandling
import BarcPersistence

@MainActor
public struct ReviewRequester {
    private let action: any RequestReviewAction
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    public init(
        action: any RequestReviewAction
    ) {
        self.action = action
    }

    @MainActor
    public func requestReviewIfNeeded() throws {
        guard try repository.codes.count % 3 == 0 else { return }
        action()
    }
}
