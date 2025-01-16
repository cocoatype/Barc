//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import ErrorHandling
import Navigation
import Persistence
import Purchasing
import Root
import Shortcuts
import SwiftUI
import SwiftUIIntrospect

@main
struct BarcMobileApp: App {
    @State private var navigator: Navigator

    private let barcodeRepository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    @MainActor init(
        barcodeRepository: any BarcodeRepository,
        purchaseRepository: any PurchaseRepository,
        errorHandler: any ErrorHandler
    ) {
        self.barcodeRepository = barcodeRepository
        self.errorHandler = errorHandler

        let navigator = Navigator()
        AppDependencyManager.shared.add(dependency: navigator)
        _navigator = State(initialValue: navigator)
    }

    init() {
        self.init(
            barcodeRepository: Persistence.guardLetNotIsScrollingDoesNotEqual,
            purchaseRepository: Purchasing.defaultRepository,
            errorHandler: ErrorHandling.defaultHandler
        )
    }

    var body: some Scene {
        WindowGroup {
            RootView(
                path: $navigator.path,
                repository: barcodeRepository,
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
