//  Created by Geoff Pado on 1/29/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct PurchaseMarketingTopBarSubheadline: View {
    var body: some View {
        Text(PaywallStrings.PurchaseMarketingTopBarSubheadlineLabel.text)
            .foregroundColor(.secondary)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.title3)
    }
}
