//  Created by Geoff Pado on 5/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcPaywall

public struct UnpurchasedAlertViewModifier: ViewModifier {
    @Binding private var isPresented: Bool
    private let feature: UnpurchasedFeature
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        for feature: UnpurchasedFeature,
        isPresented: Binding<Bool>,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        _isPresented = isPresented
        self.feature = feature
        self.errorHandler = errorHandler
        self.logger = logger
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
                PaywallView(
                    errorHandler: errorHandler,
                    logger: logger
                )
            }
    }

    private typealias Strings = BarcUnpurchased.Strings.UnpurchasedAlertViewModifier
}

public extension View {
    func unpurchasedAlert(
        for feature: UnpurchasedFeature,
        isPresented: Binding<Bool>,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) -> ModifiedContent<Self, UnpurchasedAlertViewModifier> {
        modifier(
            UnpurchasedAlertViewModifier(
                for: feature,
                isPresented: isPresented,
                errorHandler: errorHandler,
                logger: logger
            )
        )
    }
}
