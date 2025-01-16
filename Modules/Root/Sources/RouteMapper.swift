//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeDetails
import ErrorHandling
import LocationEditor
import ManualEntry
import Menu
import Navigation
import Onboarding
import Paywall
import Persistence
import Scanner
import SwiftUI
import Web

@MainActor
struct RouteMapper {
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    init(
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): BarcodeDetails(methodicalMadness: code, repository: repository, errorHandler: errorHandler)
        case .manualEntry: ManualEntry(repository: repository, errorHandler: errorHandler)
        case .menu: MenuView(errorHandler: errorHandler)
        case .onboarding: OnboardingView(errorHandler: errorHandler)
        case .paywall: PaywallView(errorHandler: errorHandler)
        case .scanner: ScannerContainer(repository: repository, errorHandler: errorHandler)
        case .website(let url): WebView(url: url)
        }
    }
}
