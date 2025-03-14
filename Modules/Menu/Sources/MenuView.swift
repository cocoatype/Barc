//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDefaults
import BarcErrorHandling
import BarcOnboarding
import BarcPaywall
import BarcReleases

public struct MenuView: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    public init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    public var body: some View {
        NavigationStack {
            MenuList(
                defaultsProvider: defaultsProvider,
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
        defaultsProvider: PreviewDefaultsProvider(),
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler()
    ).tint(.primary)
}
