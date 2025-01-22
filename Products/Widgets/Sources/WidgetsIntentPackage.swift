//  Created by Geoff Pado on 1/21/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppIntents
import WidgetShortcuts

struct WidgetsIntentsPackage: AppIntentsPackage {
    static var includedPackages: [any AppIntentsPackage.Type] {
        [
            ShortcutsPackage.self,
        ]
    }
}

