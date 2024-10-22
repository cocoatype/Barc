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
            return false
//            let customerInfo = try await Purchases.shared.customerInfo(fetchPolicy: .fetchCurrent)
//            let isUnleashedByRevenueCat = customerInfo.entitlements[Self.entitlementID]?.isActive == true
//            guard isUnleashedByRevenueCat == false else { return true }
//            return try await fallbackHasUserBeenUnleashed
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

    private let mapper = PurchaseOptionMapper()
    var purchaseOptions: [PurchaseOption] {
        get async throws {
            guard let currentOffering = try await Purchases.shared.offerings().current
            else { throw RevenueCatPurchaseRepositoryError.noCurrentOffering }
            let packages = currentOffering.availablePackages
            let packageTrialEligibilities = await Purchases.shared.checkTrialOrIntroDiscountEligibility(packages: packages)

            return packages.compactMap { package in
                try? mapper.purchaseOption(
                    for: package,
                    introEligibility: packageTrialEligibilities[package]
                )
            }
        }
    }

    func purchase(_ option: PurchaseOption) async throws {
        let productIdentifier = option.productIdentifier
        let allProducts = try await SK2Product.products(for: [productIdentifier])
        guard let product = allProducts.first(where: { $0.id == productIdentifier }) else {
            throw RevenueCatPurchaseRepositoryError.noProductForIdentifier(productIdentifier)
        }
        let storeProduct = StoreProduct(sk2Product: product)
        _ = try await Purchases.shared.purchase(product: storeProduct)
    }
}

enum RevenueCatPurchaseRepositoryError: Error {
    case noCurrentOffering
    case noProductForIdentifier(String)
}
