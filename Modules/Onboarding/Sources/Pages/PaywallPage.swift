//  Created by Geoff Pado on 12/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcPaywall

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
                        headline: Strings.PaywallPage.headline,
                        message: Strings.PaywallPage.body
                    )
                }
            }
            Spacer()
            VStack {
                HStack(spacing: 16) {
                    SecondaryButton(title: Strings.PaywallPage.secondaryButtonTitle) {
                        dismiss()
                    }
                    PrimaryButton(title: Strings.PaywallPage.primaryButtonTitle) {
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
