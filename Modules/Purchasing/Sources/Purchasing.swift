//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.


import Foundation

public enum Purchasing {
    public static let defaultRepository: any PurchaseRepository = {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
            return PreviewPurchaseRepository()
        } else {
            return RevenueCatPurchaseRepository()
        }
    }()

    public static let maxBarcodesCount = 3
}
