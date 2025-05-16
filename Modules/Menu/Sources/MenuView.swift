//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDefaults
import BarcErrorHandling
import BarcLogging
import BarcOnboarding
import BarcPaywall
import BarcReleases

public struct MenuView: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    public init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
        self.logger = logger
    }

    public var body: some View {
        NavigationStack {
            MenuList(
                defaultsProvider: defaultsProvider,
                versionProvider: versionProvider,
                errorHandler: errorHandler,
                logger: logger
            )
            .navigationDestination(for: Route.self) {
                switch $0 {
                case .paywall: PaywallView(
                    errorHandler: errorHandler,
                    logger: logger
                )
                case .onboarding: OnboardingView(
                    errorHandler: errorHandler,
                    logger: logger
                )
                }
            }
        }
    }
}

#Preview {
    MenuView(
        defaultsProvider: PreviewDefaultsProvider(),
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    ).tint(.primary)
}
