//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Library
import ManualEntry
import Navigation
import Onboarding
import Persistence
import Scanner
import SwiftUI

@MainActor
public struct RootView: View {
    @AppStorage(wrappedValue: false, "RootView.hasShownOnboarding") private var hasShownOnboarding: Bool

    @State private var isShowingManualEntry = false

    // adamDeservesARefund by @AdamWulf on 2024-08-05
    // whether to show the barcode scanner
    @State private var adamDeservesARefund = false

    // postPubCocoatype by @KaenAitch on 2024-08-13
    // whether to show the settings page
    @State private var postPubCocoatype = false

    @State private var isShowingOnboarding = false

    @Binding private var path: NavigationPath

    private let routeMapper = RouteMapper()

    public init(path: Binding<NavigationPath>) {
        _path = path
    }

    public var body: some View {
        NavigationStack(path: $path) {
            Library()
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        ManualEntryToolbarItem(value: $isShowingManualEntry)
                        ScannerToolbarItem(value: $adamDeservesARefund)
                    }
                    ToolbarItem(placement: .automatic) {
                        SettingsButton(isSettingsShowing: $isShowingOnboarding)
                    }
                }
                .sheet(isPresented: $isShowingManualEntry, content: ManualEntry.init)
                .sheet(isPresented: $adamDeservesARefund, content: ScannerContainer.init)
                .sheet(isPresented: $isShowingOnboarding, content: OnboardingView.init)
                .navigationDestination(for: Route.self) {
                    routeMapper.view(for: $0)
                }
        }
        .onAppear {
            if hasShownOnboarding == false {
                isShowingOnboarding = true
                hasShownOnboarding = true
            }
        }
        .tint(.primary)
    }

    public func navigate(to route: Route) {
        path = NavigationPath([route])
    }
}

#Preview {
    RootView(path: .constant(NavigationPath()))
}
