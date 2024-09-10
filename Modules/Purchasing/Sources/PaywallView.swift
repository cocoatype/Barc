//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Paywall
import RevenueCat
import RevenueCatUI
import SwiftUI

public struct PaywallView: View {
    public init() {}

    public var body: some View {
        PurchaseMarketingView()
            .paywallFooter(condensed: true)
            .background(Color.systemGroupedBackground.ignoresSafeArea())
    }
}

#Preview {
    PaywallView()
}
