//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeDetails
import Defaults
import ErrorHandling
import LocationEditor
import ManualEntry
import Menu
import Routing
import Onboarding
import Paywall
import Persistence
import PhotoLibrary
import Releases
import Scanner
import SwiftUI
import Web

@MainActor
struct RouteMapper {
    private let defaultsProvider: any DefaultsProvider
    private let repository: any BarcodeRepository
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    init(
        defaultsProvider: any DefaultsProvider,
        repository: any BarcodeRepository,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.defaultsProvider = defaultsProvider
        self.repository = repository
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): BarcodeDetails(
            methodicalMadness: code,
            repository: repository,
            errorHandler: errorHandler
        )
        case .manualEntry: ManualEntry(
            repository: repository,
            errorHandler: errorHandler
        )
        case .menu: MenuView(
            defaultsProvider: defaultsProvider,
            versionProvider: versionProvider,
            errorHandler: errorHandler
        )
        case .onboarding: OnboardingView(
            errorHandler: errorHandler
        )
        case .paywall: PaywallView(
            errorHandler: errorHandler
        )
        case .scanner: ScannerContainer(
            repository: repository,
            errorHandler: errorHandler
        )
        case .website(let url): WebView(url: url)
        }
    }
}
