//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcPurchasing

struct PaywallRouteCell: View {
    var body: some View {
        NavigationLink(value: Route.paywall) {
            VStack(alignment: .leading) {
                Text(Strings.PaywallRouteCell.title)
                    .font(.title3)
                    .fontWeight(.black)
                subtitleLabel
                    .foregroundStyle(Color.secondary)
            }
        }
    }

    @ViewBuilder private var subtitleLabel: some View {
        PurchaseStateView {
            Text(Strings.PaywallRouteCell.unpurchasedSubtitle)
        } purchased: {
            Text(Strings.PaywallRouteCell.purchasedSubtitle)
        } unpurchased: {
            Text(Strings.PaywallRouteCell.unpurchasedSubtitle)
        }
    }
}

#Preview {
    PaywallRouteCell()
}
