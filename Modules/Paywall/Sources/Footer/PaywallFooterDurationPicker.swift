//  Created by Geoff Pado on 10/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterDurationPicker: View {
    @Binding private var selectedPurchaseOption: PaywallPurchaseOption
    private let purchaseOptions: [PaywallPurchaseOption]

    init(purchaseOptions: [PaywallPurchaseOption], selectedPurchaseOption: Binding<PaywallPurchaseOption>) {
        self.purchaseOptions = purchaseOptions
        _selectedPurchaseOption = selectedPurchaseOption
    }

    var body: some View {
        Picker(selection: $selectedPurchaseOption) {
            ForEach(purchaseOptions) { purchaseOption in
                Button(purchaseOption.shortName) {}
                    .tag(purchaseOption)
            }
        } label: {
            Text("Purchase Option")
        }.pickerStyle(.segmented)
    }
}

#Preview {
    PaywallFooterDurationPicker(
        purchaseOptions: [
            PaywallPurchaseOption(duration: .monthly, price: 13, currency: "GBP", isEligibleForTrial: false),
            PaywallPurchaseOption(duration: .annual, price: 42, currency: "CAD", isEligibleForTrial: true),
        ],
        selectedPurchaseOption: .constant(
            PaywallPurchaseOption(duration: .annual, price: 1972, currency: "NZD", isEligibleForTrial: true)
        )
    )
}
