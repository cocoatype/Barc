//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import Navigation
import Root
import SwiftUI

@main
struct BarcMobileApp: App {
    @State private var navigator: Navigator

    init() {
        let navigator = Navigator()
        AppDependencyManager.shared.add(dependency: navigator)
        _navigator = State(initialValue: navigator)
    }

    var body: some Scene {
        WindowGroup {
            RootView(path: $navigator.path)
        }
    }
}
