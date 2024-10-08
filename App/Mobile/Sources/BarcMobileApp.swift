//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import Navigation
import Purchasing
import Root
import SwiftUI
import SwiftUIIntrospect

@main
struct BarcMobileApp: App {
    @State private var navigator: Navigator

    @MainActor init(purchaseRepository: any PurchaseRepository) {
        let navigator = Navigator()
        AppDependencyManager.shared.add(dependency: navigator)
        _navigator = State(initialValue: navigator)
    }

    init() {
        self.init(purchaseRepository: Purchasing.defaultRepository)
    }

    var body: some Scene {
        WindowGroup {
            RootView(path: $navigator.path)
                .introspect(.window, on: .iOS(.v17, .v18)) { window in
                    window.tintColor = .label
                }
        }
        .handlesExternalEvents(matching: ["codeValue="])
    }
}
