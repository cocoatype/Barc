//  Created by Geoff Pado on 9/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PurchaseAlertViewModifier: ViewModifier {
    @Binding private var isPresented: Bool
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
    }

    @State private var isShowingPaywall = false
    func body(content: Content) -> some View {
        content
            .alert(Strings.title, isPresented: $isPresented) {
                Button(Strings.paywallButton) {
                    isShowingPaywall = true
                }
                Button(Strings.cancelButton, role: .cancel) {}
            } message: {
                Text(Strings.message)
            }
            .sheet(isPresented: $isShowingPaywall) {
                PaywallView()
            }
    }

    private typealias Strings = PaywallStrings.PurchaseAlertViewModifier
}

public extension View {
    func purchaseAlert(isPresented: Binding<Bool>) -> some View {
        modifier(PurchaseAlertViewModifier(isPresented: isPresented))
    }
}
