//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Paywall
import SwiftUI

public struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentPageIndex = 0

    private let errorHandler: any ErrorHandler
    public init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    public var body: some View {
        currentPage
            .pageView(
                currentPage: $currentPageIndex,
                errorHandler: errorHandler
            )
            .environment(\.advance, AdvanceAction {
                currentPageIndex = (currentPageIndex + 1) % OnboardingPage.allCases.count
            })
    }

    private var currentPage: OnboardingPage {
        OnboardingPage.allCases[currentPageIndex]
    }
}

#Preview {
    OnboardingView(errorHandler: PreviewErrorHandler())
}
