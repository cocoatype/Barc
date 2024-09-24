//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import RevenueCat

struct RevenueCatPurchaseRepository: PurchaseRepository {
    static let initialize: () -> Void = {
        let userDefaults = UserDefaults(suiteName: "group.com.cocoatype.Barc") ?? .standard
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
            let customerInfo = try await Purchases.shared.customerInfo(fetchPolicy: .notStaleCachedOrFetched)
            return customerInfo.entitlements[Self.entitlementID]?.isActive == true
        }
    }
}
