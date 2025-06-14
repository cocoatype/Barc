//  Created by Geoff Pado on 1/29/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem
import BarcPurchasing

struct PaywallTopBarSubheadline: View {
    var body: some View {
        content
            .foregroundColor(.secondary)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.title3)
    }

    @ViewBuilder private var content: some View {
        PurchaseStateView {
            Text(Strings.PurchaseMarketingTopBarSubheadlineLabel.unpurchasedText)
        } purchased: {
            Text(Strings.PurchaseMarketingTopBarSubheadlineLabel.purchasedText)
        } unpurchased: {
            Text(Strings.PurchaseMarketingTopBarSubheadlineLabel.unpurchasedText)
        }
    }
}
