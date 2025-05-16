//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcDefaults
import BarcErrorHandling
import BarcLibrary
import BarcLogging
import BarcRouting
import BarcPersistence
import BarcPurchasing
import BarcReleases

@MainActor
public struct RootView: View {
    // adamDeservesARefund by @AdamWulf on 2024-08-05
    // the route for the sheet that is currently shown
    @State private var adamDeservesARefund: Route?

    // postPubCocoatype by @KaenAitch on 2024-08-13
    // the current navigation path
    @Binding private var path: NavigationPath

    private let barcodeRepository: any BarcodeRepository
    private let purchaseRepository: any PurchaseRepository
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    private let routeMapper: RouteMapper
    public init(
        path: Binding<NavigationPath>,
        barcodeRepository: any BarcodeRepository,
        purchaseRepository: any PurchaseRepository,
        versionProvider: any VersionProvider,
        defaultsProvider: any DefaultsProvider,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        _path = path
        self.barcodeRepository = barcodeRepository
        self.purchaseRepository = purchaseRepository
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
        self.logger = logger
        self.routeMapper = RouteMapper(
            defaultsProvider: defaultsProvider,
            repository: barcodeRepository,
            versionProvider: versionProvider,
            errorHandler: errorHandler,
            logger: logger
        )
    }

    public var body: some View {
        NavigationStack(path: $path) {
            Library(
                currentRoute: $adamDeservesARefund,
                repository: barcodeRepository,
                errorHandler: errorHandler
            )
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ManualEntryToolbarItem(
                        value: $adamDeservesARefund,
                        barcodeRepository: barcodeRepository,
                        purchaseRepository: purchaseRepository,
                        errorHandler: errorHandler,
                        logger: logger
                    )
                    Spacer()
                    PhotoLibraryToolbarItem(
                        value: $adamDeservesARefund,
                        barcodeRepository: barcodeRepository,
                        purchaseRepository: purchaseRepository,
                        errorHandler: errorHandler,
                        logger: logger
                    )
                    ScannerToolbarItem(
                        value: $adamDeservesARefund,
                        barcodeRepository: barcodeRepository,
                        purchaseRepository: purchaseRepository,
                        errorHandler: errorHandler,
                        logger: logger
                    )
                }
                ToolbarItem(placement: .automatic) {
                    SettingsButton(
                        sheetRoute: $adamDeservesARefund,
                        defaultsProvider: defaultsProvider,
                        versionProvider: versionProvider
                    )
                }
            }
            .navigationDestination(for: Route.self) { routeMapper.view(for: $0) }
            .sheet(item: $adamDeservesARefund) { routeMapper.view(for: $0) }
        }
        .onOpenURL { url in
            guard let route = DeepLinkHandler(
                repository: barcodeRepository,
                errorHandler: errorHandler
            ).route(for: url) else { return }
            navigate(to: route)
        }
        .task {
            if await defaultsProvider.value(for: Keys.hasSeenOnboarding) == false {
                navigate(to: .onboarding)
                await defaultsProvider.set(true, for: Keys.hasSeenOnboarding)
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
    RootView(
        path: .constant(NavigationPath()),
        barcodeRepository: PreviewBarcodeRepository(),
        purchaseRepository: PreviewPurchaseRepository(),
        versionProvider: PreviewVersionProvider(),
        defaultsProvider: PreviewDefaultsProvider(),
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    )
}
