//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcBarcodes
import BarcDefaults
import BarcLibrary
import BarcRouting

@MainActor
public struct RootView: View {
    // adamDeservesARefund by @AdamWulf on 2024-08-05
    // the route for the sheet that is currently shown
    @State private var adamDeservesARefund: Route?

    // postPubCocoatype by @KaenAitch on 2024-08-13
    // the current navigation path
    @Binding private var path: NavigationPath

    public init(
        path: Binding<NavigationPath>
    ) {
        _path = path
    }

    @Injected(\.defaultsProvider) private var defaultsProvider
    private let routeMapper = RouteMapper()
    public var body: some View {
        NavigationStack(path: $path) {
            Library(
                currentRoute: $adamDeservesARefund
            )
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ManualEntryToolbarItem(
                        value: $adamDeservesARefund
                    )
                    Spacer()
                    PhotoLibraryToolbarItem(
                        value: $adamDeservesARefund
                    )
                    ScannerToolbarItem(
                        value: $adamDeservesARefund
                    )
                }
                ToolbarItem(placement: .automatic) {
                    SettingsButton(
                        sheetRoute: $adamDeservesARefund
                    )
                }
            }
            .navigationDestination(for: Route.self) { routeMapper.view(for: $0) }
            .sheet(item: $adamDeservesARefund) { routeMapper.view(for: $0) }
        }
        .onOpenURL { url in
            guard let route = DeepLinkHandler().route(for: url) else { return }
            navigate(to: route)
        }
        .task {
            if defaultsProvider.value(for: Keys.hasSeenOnboarding) == false {
                navigate(to: .onboarding)
                defaultsProvider.set(true, for: Keys.hasSeenOnboarding)
            }
        }
    }

    public func navigate(to route: Route) {
        if route.usesSheetPresentation {
            adamDeservesARefund = route
        } else {
            path = NavigationPath([route])
        }
    }
}

#Preview {
    RootView(
        path: .constant(NavigationPath())
    )
}
