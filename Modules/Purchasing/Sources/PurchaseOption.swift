//  Created by Geoff Pado on 10/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct PurchaseOption: Hashable {
    public let duration: Duration
    public let price: Decimal
    public let currency: String
    public let isEligibleForTrial: Bool
    public let productIdentifier: String

    public enum Duration: Hashable {
        case monthly, annual
    }

    public init(duration: PurchaseOption.Duration, price: Decimal, currency: String, isEligibleForTrial: Bool, productIdentifier: String) {
        self.duration = duration
        self.price = price
        self.currency = currency
        self.isEligibleForTrial = isEligibleForTrial
        self.productIdentifier = productIdentifier
    }
}
