//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Foundation
import RevenueCat
import StoreKit

struct RevenueCatPurchaseRepository: PurchaseRepository {
    static let initialize: () -> Void = {
        guard let userDefaults = UserDefaults(suiteName: "group.com.cocoatype.Barc") else {
            ErrorHandling.defaultHandler.fatalError("Unable to create shared user defaults")
        }

        let configuration = Configuration.Builder(withAPIKey: "appl_qYQUCjAKqlSxoGqUuwBHysdhQTT")
            .with(userDefaults: userDefaults)
        Purchases.configure(with: configuration)
        Purchases.logLevel = .debug

        return {}
    }()

    init() {
        Self.initialize()
    }

    private static let entitlementID = "unleashed"
    var hasUserBeenUnleashed: Bool {
        get async throws {
            let customerInfo = try await Purchases.shared.customerInfo(fetchPolicy: .fetchCurrent)
            let isUnleashedByRevenueCat = customerInfo.entitlements[Self.entitlementID]?.isActive == true
            guard isUnleashedByRevenueCat == false else { return true }
            return try await fallbackHasUserBeenUnleashed
        }
    }

    var fallbackHasUserBeenUnleashed: Bool {
        get async throws {
            let products = try await Product.products(for: ["barc_099_1m_0d0", "barc_499_1y_14d0"])
            for product in products {
                switch await product.currentEntitlement {
                case .verified: return true
                case .unverified, .none: break
                }
            }

            return false
        }
    }
}
