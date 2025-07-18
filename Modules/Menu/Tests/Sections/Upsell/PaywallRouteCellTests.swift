//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import BarcPersistenceDoubles
import BarcPurchasingDoubles

@testable import BarcMenu

@MainActor @Suite(.container)
struct PaywallRouteCellTests {
    @Test(arguments: [
        (Strings.PaywallRouteCell.purchasedSubtitle, true),
        (Strings.PaywallRouteCell.unpurchasedSubtitle, false),
        (Strings.PaywallRouteCell.unpurchasedSubtitle, nil),
    ])
    func purchaseStateSubtitle(expectedSubtitle: String, cachedValue: Bool?) throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = cachedValue
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PaywallRouteCell()

        _ = try view.inspect().find(text: expectedSubtitle)
    }
}
