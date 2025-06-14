//  Created by Geoff Pado on 9/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcPurchasing
import BarcTestHelpersInterface

public struct StubPurchaseRepository: PurchaseRepository {
    public init() {}

    public var cachedHasUserBeenUnleashed: Bool? = false

    public var hasUserBeenUnleashedResult = Result<Bool, Error>.success(false)
    public var hasUserBeenUnleashed: Bool {
        get throws {
            return try hasUserBeenUnleashedResult.get()
        }
    }

    public var purchaseOptions = [PurchaseOption]()

    public func purchase(_ option: PurchaseOption) async throws {}
}
