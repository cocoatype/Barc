//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import AppShortcuts
import Defaults
import ErrorHandling
import Navigation
import Persistence
import Purchasing
import Releases
import Root
import SwiftUI
import SwiftUIIntrospect

@main
struct BarcMobileApp: App {
    @State private var navigator: Navigator

    private let barcodeRepository: any BarcodeRepository
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
                repository: barcodeRepository,
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
