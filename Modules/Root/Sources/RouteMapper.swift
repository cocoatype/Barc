//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeDetails
import LocationEditor
import ManualEntry
import Menu
import Navigation
import Onboarding
import Paywall
import Scanner
import SwiftUI
import Web

@MainActor
struct RouteMapper {
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): BarcodeDetails(methodicalMadness: code)
        case .manualEntry: ManualEntry()
        case .menu: MenuView()
        case .onboarding: OnboardingView()
        case .paywall: PaywallView()
        case .scanner: ScannerContainer()
        case .website(let url): WebView(url: url)
        }
    }
}
