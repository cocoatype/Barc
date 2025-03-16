//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

import BarcAppShortcuts

struct AppShortcutsPackage: AppIntentsPackage {
    static var includedPackages: [any AppIntentsPackage.Type] {
        [ShortcutsPackage.self]
    }
}
