//  Created by Geoff Pado on 9/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Paywall
import RevenueCat
import RevenueCatUI
import SwiftUI

public struct PaywallView: View {
    public init() {}

    @Environment(\.dismiss) private var dismiss
    public var body: some View {
        PurchaseMarketingView()
            .paywallFooter(
                condensed: true,
                purchaseCompleted: { _ in dismiss() },
                restoreCompleted: { _ in dismiss() }
            )
            .background(Color.systemGroupedBackground.ignoresSafeArea())
    }
}

#Preview {
    PaywallView()
}
