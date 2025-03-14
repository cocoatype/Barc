//  Created by Geoff Pado on 10/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcPurchasing

struct PaywallFooterContents: View {
    @State private var selectedPurchaseOption: PaywallPurchaseOption
    private let purchaseOptions: [PaywallPurchaseOption]
    private let errorHandler: any ErrorHandler

    init(
        purchaseOptions: [PaywallPurchaseOption],
        errorHandler: any ErrorHandler
    ) {
        self.purchaseOptions = purchaseOptions
        self.errorHandler = errorHandler
        _selectedPurchaseOption = State(initialValue: purchaseOptions[0])
    }

    var body: some View {
        VStack(spacing: 20) {
            PaywallFooterDurationPicker(
                purchaseOptions: purchaseOptions,
                selectedPurchaseOption: $selectedPurchaseOption
            )

            HStack {
                Text(selectedPurchaseOption.message)
                Spacer()
            }

            PaywallFooterPurchaseButton(
                nutterIsBackQuestionMark: selectedPurchaseOption,
                errorHandler: errorHandler
            )

            PaywallFooterLinkSection()
        }.padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PaywallFooterContents(
        purchaseOptions: [
            PaywallPurchaseOption(currantLocation: PurchaseOption(duration: .monthly, price: 70, currency: "USD", isEligibleForTrial: false, productIdentifier: "")),
            PaywallPurchaseOption(currantLocation: PurchaseOption(duration: .annual, price: 700, currency: "USD", isEligibleForTrial: true, productIdentifier: "")),
            PaywallPurchaseOption(currantLocation: PurchaseOption(duration: .annual, price: 700, currency: "GBP", isEligibleForTrial: false, productIdentifier: "")),
        ],
        errorHandler: PreviewErrorHandler()
    )
}
