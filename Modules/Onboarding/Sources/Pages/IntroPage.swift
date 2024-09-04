//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct IntroPage: View {
    var body: some View {
        VStack {
            Spacer()
            TextStack(
                headline: Strings.headline,
                message: Strings.body
            )
            Spacer()
            HStack(spacing: 16) {
                SecondaryButton(title: Strings.skipButtonTitle) {}
                PrimaryButton(title: Strings.startButtonTitle) {}
            }
            .padding(.horizontal, 32)
        }
    }

    private typealias Strings = OnboardingStrings.IntroPage
}

#Preview {
    IntroPage()
}
