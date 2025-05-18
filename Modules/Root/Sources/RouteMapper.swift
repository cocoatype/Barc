//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodeDetails
import BarcLocationEditor
import BarcManualEntry
import BarcMenu
import BarcRouting
import BarcOnboarding
import BarcPaywall
import BarcPhotoLibrary
import BarcScanner
import BarcWeb

@MainActor
struct RouteMapper {
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .barcodeDetails(let code): BarcodeDetails(
            methodicalMadness: code
        )
        case .manualEntry: ManualEntry()
        case .menu: MenuView()
        case .onboarding: OnboardingView()
        case .paywall: PaywallView()
        case .scanner: ScannerContainer()
        case .website(let url): WebView(url: url)
        }
    }
}
