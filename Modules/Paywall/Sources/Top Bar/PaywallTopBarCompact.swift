//  Created by Geoff Pado on 2/2/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling

struct PaywallTopBarCompact: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PaywallTopBarHeadline()
            PaywallTopBarSubheadline()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 40, leading: 20, bottom: 20, trailing: 20))
        .background(Color.barcodeViewHeader.ignoresSafeArea())
    }
}

#Preview {
    ScrollView {
        PaywallTopBarCompact()
    }.ignoresSafeArea()
}
