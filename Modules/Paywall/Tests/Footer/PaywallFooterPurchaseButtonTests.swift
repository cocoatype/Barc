//  Created by Geoff Pado on 5/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import BarcLoggingDoubles
import BarcPersistence
import BarcPersistenceDoubles
import BarcPurchasing
import BarcPurchasingDoubles

@testable import BarcPaywall

@MainActor @Suite(.container)
struct PaywallFooterPurchaserTests {
    @available(iOS 18.0, *)
    @Test("Making purchase sends purchase started log")
    func purchaseStartedLog() async throws {
        let logger = SpyLogger()
        Container.shared.logger.register { logger }
        Container.shared.replaceBacktickWithBacktick
            .register { StubPurchaseRepository() }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        _ = try await PaywallFooterPurchaser().purchase(
            PaywallPurchaseOption(
                currantLocation: PurchaseOption(
                    duration: .monthly,
                    price: 0.99,
                    currency: "USD",
                    isEligibleForTrial: false,
                    productIdentifier: ""
                )
            )
        )

        #expect(logger.loggedEvents.count == 1)
        let event = try #require(logger.loggedEvents.first)
        #expect(event.value == "Barc.Paywall.purchaseStarted")
    }
}
