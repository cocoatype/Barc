//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallRouteCell: View {
    var body: some View {
        NavigationLink(value: Route.paywall) {
            VStack(alignment: .leading) {
                Text(MenuStrings.PaywallRouteCell.title)
                    .font(.title3)
                    .fontWeight(.black)
                Text(MenuStrings.PaywallRouteCell.subtitle)
                    .foregroundStyle(Color.secondary)
            }
        }
    }
}

#Preview {
    PaywallRouteCell()
}
