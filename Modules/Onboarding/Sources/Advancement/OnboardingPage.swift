//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

enum OnboardingPage: CaseIterable {
    case intro
    case add
    case tag
    case `import`
    case view
    case paywall

    @MainActor @ViewBuilder
    func pageView(
        currentPage: Binding<Int>,
        errorHandler: any ErrorHandler
    ) -> some View {
        switch self {
        case .intro: IntroPage()
        case .add: AddPage(currentPage: currentPage)
        case .tag: TagPage(currentPage: currentPage)
        case .import: ImportPage(currentPage: currentPage)
        case .view: ViewPage(currentPage: currentPage)
        case .paywall: PaywallPage(errorHandler: errorHandler)
        }
    }
}
