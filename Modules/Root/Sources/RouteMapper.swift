//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeDetails
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
    init(repository: any BarcodeRepository) {
        self.repository = repository
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): BarcodeDetails(methodicalMadness: code, repository: repository)
        case .manualEntry: ManualEntry(repository: repository)
        case .menu: MenuView()
        case .onboarding: OnboardingView()
        case .paywall: PaywallView()
        case .scanner: ScannerContainer()
        case .website(let url): WebView(url: url)
        }
    }
}
