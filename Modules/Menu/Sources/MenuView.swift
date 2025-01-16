//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Onboarding
import Paywall
import Releases
import SwiftUI

public struct MenuView: View {
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    public init(
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    public var body: some View {
        NavigationStack {
            MenuList(
                versionProvider: versionProvider,
                errorHandler: errorHandler
            )
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
    MenuView(
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler()
    ).tint(.primary)
}
