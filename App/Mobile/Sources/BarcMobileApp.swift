//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import SwiftUI
import SwiftUIIntrospect

import BarcAppShortcuts
import BarcDefaults
import BarcErrorHandling
import BarcRouting
import BarcPersistence
import BarcPurchasing
import BarcReleases
import BarcRoot

@main
struct BarcMobileApp: App {
    @State private var navigator: Navigator

    private let barcodeRepository: any BarcodeRepository
    private let purchaseRepository: any PurchaseRepository
    private let versionProvider: any VersionProvider
    private let defaultsProvider: any DefaultsProvider
    private let errorHandler: any ErrorHandler
    @MainActor init(
        barcodeRepository: any BarcodeRepository,
        purchaseRepository: any PurchaseRepository,
        versionProvider: any VersionProvider,
        defaultsProvider: any DefaultsProvider,
        errorHandler: any ErrorHandler
    ) {
        self.barcodeRepository = barcodeRepository
        self.purchaseRepository = purchaseRepository
        self.versionProvider = versionProvider
        self.defaultsProvider = defaultsProvider
        self.errorHandler = errorHandler

        let navigator = Navigator()
        AppDependencyManager.shared.add(dependency: navigator)
        _navigator = State(initialValue: navigator)
    }

    init() {
        self.init(
            barcodeRepository: Persistence.guardLetNotIsScrollingDoesNotEqual,
            purchaseRepository: Purchasing.defaultRepository,
            versionProvider: Releases.versionProvider,
            defaultsProvider: Defaults.provider,
            errorHandler: ErrorHandling.defaultHandler
        )
    }

    var body: some Scene {
        WindowGroup {
            RootView(
                path: $navigator.path,
                barcodeRepository: barcodeRepository,
                purchaseRepository: purchaseRepository,
                versionProvider: versionProvider,
                defaultsProvider: defaultsProvider,
                errorHandler: errorHandler
            )
            .introspect(.window, on: .iOS(.v17, .v18)) { window in
                window.tintColor = .label
            }
            .onAppear {
                ShortcutsProvider.updateAppShortcutParameters()
            }
        }
        .handlesExternalEvents(matching: ["barc:///"])
    }
}
