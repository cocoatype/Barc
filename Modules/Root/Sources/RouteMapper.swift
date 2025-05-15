//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodeDetails
import BarcDefaults
import BarcErrorHandling
import BarcLocationEditor
import BarcLogging
import BarcManualEntry
import BarcMenu
import BarcRouting
import BarcOnboarding
import BarcPaywall
import BarcPersistence
import BarcPhotoLibrary
import BarcReleases
import BarcScanner
import BarcWeb

@MainActor
struct RouteMapper {
    private let defaultsProvider: any DefaultsProvider
    private let repository: any BarcodeRepository
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        defaultsProvider: any DefaultsProvider,
        repository: any BarcodeRepository,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.defaultsProvider = defaultsProvider
        self.repository = repository
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
        self.logger = logger
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): BarcodeDetails(
            methodicalMadness: code,
            repository: repository,
            errorHandler: errorHandler,
            logger: logger
        )
        case .manualEntry: ManualEntry(
            repository: repository,
            errorHandler: errorHandler
        )
        case .menu: MenuView(
            defaultsProvider: defaultsProvider,
            versionProvider: versionProvider,
            errorHandler: errorHandler,
            logger: logger
        )
        case .onboarding: OnboardingView(
            errorHandler: errorHandler,
            logger: logger
        )
        case .paywall: PaywallView(
            errorHandler: errorHandler,
            logger: logger
        )
        case .scanner: ScannerContainer(
            repository: repository,
            errorHandler: errorHandler
        )
        case .website(let url): WebView(url: url)
        }
    }
}
