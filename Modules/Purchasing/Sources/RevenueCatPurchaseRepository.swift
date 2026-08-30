//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import StoreKit

import FactoryKit
import RevenueCat

import BarcErrorHandling

final class RevenueCatPurchaseRepository: PurchaseRepository {
    init() {}

    private static let entitlementID = "unleashed"
    @MainActor let cachedHasUserBeenUnleashed: Bool? = true

    @MainActor var hasUserBeenUnleashed: Bool {
        get async throws {
            return true
        }
    }

    let fallbackHasUserBeenUnleashed = true

    private let mapper = PurchaseOptionMapper()
    let purchaseOptions = [PurchaseOption]()
    func purchase(_ option: PurchaseOption) async throws {}
}
