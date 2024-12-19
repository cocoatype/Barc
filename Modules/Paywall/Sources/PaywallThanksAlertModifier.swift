//  Created by Geoff Pado on 12/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallThanksAlertModifier: ViewModifier {
    @Binding var paywallThanksAlertIsPresented: Bool
    init(paywallThanksAlertIsPresented: Binding<Bool>) {
        _paywallThanksAlertIsPresented = paywallThanksAlertIsPresented
    }

    @Environment(\.dismiss) private var dismiss
    func body(content: Content) -> some View {
        content
            .alert(
                Strings.title,
                isPresented: $paywallThanksAlertIsPresented) {
                    Button(Strings.dismissButtonTitle) {
                        dismiss()
                    }
                } message: {
                    Text(Strings.message)
                }

    }

    private typealias Strings = PaywallStrings.PaywallThanksAlertModifier
}

extension View {
    func thanksAlert(isPresented: Binding<Bool>) -> some View {
        modifier(PaywallThanksAlertModifier(paywallThanksAlertIsPresented: isPresented))
    }
}
