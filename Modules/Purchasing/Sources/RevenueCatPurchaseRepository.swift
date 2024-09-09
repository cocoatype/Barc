//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import RevenueCat

struct RevenueCatPurchaseRepository: PurchaseRepository {
    static func initialize() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_qYQUCjAKqlSxoGqUuwBHysdhQTT")
    }
}
