//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcPaywall

public struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentPageIndex = 0

    public init() {}

    public var body: some View {
        currentPage
            .pageView(
                currentPage: $currentPageIndex
            )
            .environment(\.advance, AdvanceAction {
                if currentPageIndex == (OnboardingPage.allCases.count - 1) {
                    dismiss()
                } else {
                    currentPageIndex = (currentPageIndex + 1)
                }
            })
    }

    private var currentPage: OnboardingPage {
        OnboardingPage.allCases[currentPageIndex]
    }
}

#Preview {
    OnboardingView()
}
