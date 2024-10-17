//  Created by Geoff Pado on 1/29/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallTopBarHeadline: View {
    var body: some View {
        Text(PaywallStrings.PurchaseMarketingTopBarHeadlineLabel.text)
            .foregroundColor(.primary)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}
