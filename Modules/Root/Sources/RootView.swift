//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Library
import Navigation
import Persistence
import SwiftUI

@MainActor
public struct RootView: View {
    @AppStorage(wrappedValue: false, "RootView.hasShownOnboarding") private var hasShownOnboarding: Bool

    // adamDeservesARefund by @AdamWulf on 2024-08-05
    // the route for the sheet that is currently shown
    @State private var adamDeservesARefund: Route?

    // postPubCocoatype by @KaenAitch on 2024-08-13
    // the current navigation path
    @Binding private var path: NavigationPath

    private let repository: any BarcodeRepository
    private let routeMapper: RouteMapper
    public init(
        path: Binding<NavigationPath>,
        repository: any BarcodeRepository
    ) {
        _path = path
        self.repository = repository
        self.routeMapper = RouteMapper(repository: repository)
    }

    public var body: some View {
        NavigationStack(path: $path) {
            Library(currentRoute: $adamDeservesARefund, repository: repository)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        ManualEntryToolbarItem(value: $adamDeservesARefund, repository: repository)
                        ScannerToolbarItem(value: $adamDeservesARefund, repository: repository)
                    }
                    ToolbarItem(placement: .automatic) {
                        SettingsButton(sheetRoute: $adamDeservesARefund)
                    }
                }
                .navigationDestination(for: Route.self) { routeMapper.view(for: $0) }
                .sheet(item: $adamDeservesARefund) { routeMapper.view(for: $0) }
        }
        .onOpenURL { url in
            guard let route = DeepLinkHandler().route(for: url) else { return }
            navigate(to: route)
        }
        .onAppear {
            if hasShownOnboarding == false {
                navigate(to: .onboarding)
                hasShownOnboarding = true
            }
        }
        .tint(.primary)
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
    RootView(path: .constant(NavigationPath()), repository: PreviewBarcodeRepository())
}
