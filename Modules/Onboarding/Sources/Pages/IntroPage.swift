//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct IntroPage: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.advance) private var advance

    var body: some View {
        VStack {
            Spacer()
            TextStack(
                headline: Strings.headline,
                message: Strings.body
            )
            Spacer()
            HStack(spacing: 16) {
                SecondaryButton(title: Strings.skipButtonTitle) { dismiss() }
                PrimaryButton(title: Strings.startButtonTitle) { advance() }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 16)
        }
    }

    private typealias Strings = OnboardingStrings.IntroPage
}

#Preview {
    IntroPage()
}
