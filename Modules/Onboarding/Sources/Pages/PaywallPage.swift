//  Created by Geoff Pado on 12/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Paywall
import SwiftUI

struct PaywallPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingPaywall = false
    var body: some View {
        VStack {
            ScrollIfNecessary {
                VStack {
                    Asset.paywallOnboarding.swiftUIImage
                        .padding(.top, 16)
                    TextStack(
                        headline: OnboardingStrings.PaywallPage.headline,
                        message: OnboardingStrings.PaywallPage.body
                    )
                }
            }
            Spacer()
            VStack {
                HStack(spacing: 16) {
                    SecondaryButton(title: OnboardingStrings.PaywallPage.secondaryButtonTitle) {
                        dismiss()
                    }
                    PrimaryButton(title: OnboardingStrings.PaywallPage.primaryButtonTitle) {
                        isShowingPaywall = true
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
            }
        }
        .sheet(isPresented: $isShowingPaywall) {
            dismiss()
        } content: {
            PaywallView()
        }
    }
}

#Preview {
    PaywallPage()
}
