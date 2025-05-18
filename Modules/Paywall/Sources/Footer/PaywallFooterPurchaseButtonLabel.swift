//  Created by Geoff Pado on 5/18/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem

struct PaywallFooterPurchaseButtonLabel: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var body: some View {
        Text(string)
            .fontWeight(.bold)
            .foregroundStyle(Color.primaryButtonLabel)
            .padding(12)
            .frame(maxWidth: .infinity, minHeight: 44)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.primaryButtonBackground)
            }
    }
}

#Preview {
    PaywallFooterPurchaseButtonLabel("Buy Now")
        .padding()
}
