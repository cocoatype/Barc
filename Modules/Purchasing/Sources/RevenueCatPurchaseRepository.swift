//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import RevenueCat

struct RevenueCatPurchaseRepository: PurchaseRepository {
    static func initialize() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_qYQUCjAKqlSxoGqUuwBHysdhQTT")
    }

    private static let entitlementID = "unleashed"
    var hasUserBeenUnleashed: Bool {
        get async throws {
            let customerInfo = try await Purchases.shared.customerInfo()
            return customerInfo.entitlements[Self.entitlementID]?.isActive == true
        }
    }
}
