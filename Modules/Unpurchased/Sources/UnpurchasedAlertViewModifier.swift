//  Created by Geoff Pado on 5/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Paywall
import SwiftUI

public struct UnpurchasedAlertViewModifier: ViewModifier {
    @Binding private var isPresented: Bool
    private let feature: UnpurchasedFeature
    init(for feature: UnpurchasedFeature, isPresented: Binding<Bool>) {
        _isPresented = isPresented
        self.feature = feature
    }

    @State private var isShowingPaywall = false
    public func body(content: Content) -> some View {
        content
            .alert(Strings.title, isPresented: $isPresented) {
                Button(Strings.learnMoreButton) {
                    isShowingPaywall = true
                }
                Button(Strings.dismissButton, role: .cancel) {}
            } message: {
                Text(feature.message)
            }
            .sheet(isPresented: $isShowingPaywall) {
                PaywallView()
            }
    }

    private typealias Strings = UnpurchasedStrings.UnpurchasedAlertViewModifier
}

public extension View {
    func unpurchasedAlert(for feature: UnpurchasedFeature, isPresented: Binding<Bool>) -> ModifiedContent<Self, UnpurchasedAlertViewModifier> {
        modifier(UnpurchasedAlertViewModifier(for: feature, isPresented: isPresented))
    }
}
