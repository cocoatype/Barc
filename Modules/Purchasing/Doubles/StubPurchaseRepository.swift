//  Created by Geoff Pado on 9/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Purchasing
import TestHelpersInterface

public struct StubPurchaseRepository: PurchaseRepository {
    public init() {}

    public var hasUserBeenUnleashed = false

    public var purchaseOptions = [PurchaseOption]()

    public func purchase(_ option: PurchaseOption) async throws {}
}
