//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public struct PreviewPurchaseRepository: PurchaseRepository {
    public init() {}

    public var purchaseOptions: [PurchaseOption] = [
        PurchaseOption(duration: .monthly, price: 4.99, currency: "USD", isEligibleForTrial: false, productIdentifier: ""),
        PurchaseOption(duration: .annual, price: 41.99, currency: "USD", isEligibleForTrial: true, productIdentifier: ""),
    ]

    @MainActor public var hasUserBeenUnleashed: Bool = false
    @MainActor public var cachedHasUserBeenUnleashed: Bool = false

    public func purchase(_ option: PurchaseOption) async throws {}
}
