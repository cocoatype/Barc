//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcPaywall

public struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentPageIndex = 0

    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    public init(
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.errorHandler = errorHandler
        self.logger = logger
    }

    public var body: some View {
        currentPage
            .pageView(
                currentPage: $currentPageIndex,
                errorHandler: errorHandler,
                logger: logger
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
    OnboardingView(
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    )
}
