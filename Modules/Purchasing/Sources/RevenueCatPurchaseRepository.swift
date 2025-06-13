//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import StoreKit

import FactoryKit
import RevenueCat

import BarcErrorHandling

final class RevenueCatPurchaseRepository: PurchaseRepository {
    static let initialize: @Sendable () -> Void = {
        guard let userDefaults = UserDefaults(suiteName: "group.com.cocoatype.Barc") else {
            Container.shared.errorHandler().fatalError("Unable to create shared user defaults")
        }

        let configuration = Configuration.Builder(withAPIKey: "appl_qYQUCjAKqlSxoGqUuwBHysdhQTT")
            .with(userDefaults: userDefaults)
        Purchases.configure(with: configuration)
        Purchases.logLevel = .error

        return {}
    }()

    init() {
        Self.initialize()

        Task {
            try await updateCache()
        }
    }

    private static let entitlementID = "unleashed"
    @MainActor var cachedHasUserBeenUnleashed = Bool?.none

    @MainActor var hasUserBeenUnleashed: Bool {
        get async throws {
            return try await updateCache()
        }
    }

    @MainActor @discardableResult private func updateCache() async throws -> Bool {
        let customerInfo = try await Purchases.shared.customerInfo(fetchPolicy: .fetchCurrent)
        let newValue = if customerInfo.entitlements[Self.entitlementID]?.isActive == true {
            true
        } else if try await fallbackHasUserBeenUnleashed {
            true
        } else {
            false
        }

        cachedHasUserBeenUnleashed = newValue
        return newValue
    }

    var fallbackHasUserBeenUnleashed: Bool {
        get async throws {
            return await Transaction.currentEntitlements.contains { result in
                switch result {
                case .verified: return true
                case .unverified: return false
                }
            }
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
        try await updateCache()
    }
}
