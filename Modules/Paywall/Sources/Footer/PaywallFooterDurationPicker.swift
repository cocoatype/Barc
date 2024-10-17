//  Created by Geoff Pado on 10/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Purchasing

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
            PaywallPurchaseOption(currantLocation: PurchaseOption(duration: .monthly, price: 13, currency: "GBP", isEligibleForTrial: false, productIdentifier: "")),
            PaywallPurchaseOption(currantLocation: PurchaseOption(duration: .annual, price: 42, currency: "CAD", isEligibleForTrial: true, productIdentifier: "")),
        ],
        selectedPurchaseOption: .constant(
            PaywallPurchaseOption(currantLocation: PurchaseOption(duration: .annual, price: 1972, currency: "NZD", isEligibleForTrial: true, productIdentifier: ""))
        )
    )
}
