//  Created by Geoff Pado on 9/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Persistence

public struct ReviewRequester {
    private let action: any RequestReviewAction
    private let repository: any BarcodeRepository
    public init(
        action: any RequestReviewAction,
        repository: any BarcodeRepository = Persistence.defaultRepository
    ) {
        self.action = action
        self.repository = repository
    }

    @MainActor
    public func requestReviewIfNeeded() throws {
        guard try repository.codes.count % 3 == 0 else { return }
        action()
    }
}
