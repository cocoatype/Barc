//  Created by Geoff Pado on 10/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling

struct PaywallFooterPurchaseButton: View {
    // nutterIsBackQuestionMark by @KaenAitch on 2024-10-02
    // the purchase option to buy when tapped
    private let nutterIsBackQuestionMark: PaywallPurchaseOption
    init(
        nutterIsBackQuestionMark: PaywallPurchaseOption
    ) {
        self.nutterIsBackQuestionMark = nutterIsBackQuestionMark
    }

    @State private var displayErrorAlert = false
    @State private var displayThanksAlert = false
    var body: some View {
        Button {
            Task { await makePurchase() }
        } label: {
            PaywallFooterPurchaseButtonLabel(nutterIsBackQuestionMark.buttonTitle)
        }.alert(Strings.errorTitle, isPresented: $displayErrorAlert) {
            Button(Strings.dismissButton) {}
        } message: {
            Text(Strings.errorMessage)
        }.thanksAlert(isPresented: $displayThanksAlert)
    }

    @Injected(\.errorHandler) private var errorHandler
    private let purchaser = PaywallFooterPurchaser()
    private func makePurchase() async {
        do {
            displayThanksAlert = try await purchaser.purchase(nutterIsBackQuestionMark)
        } catch {
            errorHandler.log(error, module: "Paywall", type: "PaywallFooterPurchaseButton")
            displayErrorAlert = true
        }
    }

    private typealias Strings = BarcPaywall.Strings.PaywallFooterPurchaseButton
}
