//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import Navigation
import Purchasing
import Root
import SwiftUI

@main
struct BarcMobileApp: App {
    @State private var navigator: Navigator

    @MainActor init(purchaseRepository: any PurchaseRepository) {
        let navigator = Navigator()
        AppDependencyManager.shared.add(dependency: navigator)
        _navigator = State(initialValue: navigator)
        type(of: purchaseRepository).initialize()
    }

    init() {
        self.init(purchaseRepository: Purchasing.defaultRepository)
    }

    var body: some Scene {
        WindowGroup {
            RootView(path: $navigator.path)
        }
    }
}
