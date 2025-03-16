//  Created by Geoff Pado on 1/21/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcWidgetShortcuts

import AppIntents

struct WidgetsIntentsPackage: AppIntentsPackage {
    static var includedPackages: [any AppIntentsPackage.Type] {
        [
            ShortcutsPackage.self,
        ]
    }
}

