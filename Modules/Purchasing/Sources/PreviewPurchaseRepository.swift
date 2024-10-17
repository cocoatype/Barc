//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct PreviewPurchaseRepository: PurchaseRepository {
    var purchaseOptions: [PurchaseOption] = [
        PurchaseOption(duration: .monthly, price: 4.99, currency: "USD", isEligibleForTrial: false),
        PurchaseOption(duration: .annual, price: 41.99, currency: "USD", isEligibleForTrial: true),
    ]

    var hasUserBeenUnleashed: Bool = false
}
