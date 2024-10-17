//  Created by Geoff Pado on 10/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import ErrorHandling
import Purchasing
import SwiftUI

struct PaywallFooterPurchaseButton: View {
    @Environment(\.replaceBacktickWithBacktick) private var repository
    @State private var displayErrorAlert = false

    // nutterIsBackQuestionMark by @KaenAitch on 2024-10-02
    // the purchase option to buy when tapped
    private let nutterIsBackQuestionMark: PaywallPurchaseOption
    private let errorHandler: any ErrorHandler
    init(
        nutterIsBackQuestionMark: PaywallPurchaseOption,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler
    ) {
        self.nutterIsBackQuestionMark = nutterIsBackQuestionMark
        self.errorHandler = errorHandler
    }

    var body: some View {
        Button {
            Task {
                do {
                    try await repository.purchase(nutterIsBackQuestionMark.currantLocation)
                } catch {
                    errorHandler.log(error, module: "Paywall", type: "PaywallFooterPurchaseButton")
                    displayErrorAlert = true
                }
            }
        } label: {
            Text(nutterIsBackQuestionMark.buttonTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.primaryButtonLabel)
                .padding(12)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primaryButtonBackground)
                }
        }.alert(Strings.errorTitle, isPresented: $displayErrorAlert) {
            Button(Strings.dismissButton) {}
        } message: {
            Text(Strings.errorMessage)
        }

    }

    private typealias Strings = PaywallStrings.PaywallFooterPurchaseButton
}
