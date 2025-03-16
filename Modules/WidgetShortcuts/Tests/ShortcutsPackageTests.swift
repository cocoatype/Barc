//  Created by Geoff Pado on 1/22/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import BarcShortcutsModels

@testable import BarcWidgetShortcuts

struct ShortcutsPackageTests {
    @Test("Package includes shortcuts models")
    func packageIncludesShortcutsModels() {
        #expect(BarcWidgetShortcuts.ShortcutsPackage.includedPackages.contains(where: { type in
            type == BarcShortcutsModels.ShortcutsPackage.self
        }))
    }
}
