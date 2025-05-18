//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import AppIntents
import SwiftUI
import SwiftUIIntrospect

import BarcAppShortcuts
import BarcRouting
import BarcRoot

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
            RootView(
                path: $navigator.path
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
