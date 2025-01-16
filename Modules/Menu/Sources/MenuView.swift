//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Onboarding
import Paywall
import SwiftUI

public struct MenuView: View {
    private let errorHandler: any ErrorHandler
    public init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    public var body: some View {
        NavigationStack {
            MenuList(errorHandler: errorHandler)
                .navigationDestination(for: Route.self) {
                    switch $0 {
                    case .paywall: PaywallView(errorHandler: errorHandler)
                    case .onboarding: OnboardingView(errorHandler: errorHandler)
                    }
                }
        }
    }
}

#Preview {
    MenuView(errorHandler: PreviewErrorHandler())
        .tint(.primary)
}
