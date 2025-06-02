//  Created by Geoff Pado on 5/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

public extension Container {
    // replaceBacktickWithBacktick by @KaenAitch on 2024-09-23
    // the purchasing repository for the app
    var replaceBacktickWithBacktick: Factory<any PurchaseRepository> {
        Factory(self) {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
                PreviewPurchaseRepository()
            } else {
                RevenueCatPurchaseRepository()
            }
        }.singleton
    }
}
