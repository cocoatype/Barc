//  Created by Geoff Pado on 9/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Purchasing
import TestHelpersInterface

public struct StubPurchaseRepository: PurchaseRepository {
    public static var initializeExpectation: Expectation?
    public static func initialize() {
        initializeExpectation?.fulfill()
    }

    public init() {}

    public var hasUserBeenUnleashed = false
}
