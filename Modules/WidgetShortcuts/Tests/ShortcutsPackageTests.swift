//  Created by Geoff Pado on 1/22/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ShortcutsModels
import Testing

@testable import WidgetShortcuts

struct ShortcutsPackageTests {
    @Test("Package includes shortcuts models")
    func packageIncludesShortcutsModels() {
        #expect(WidgetShortcuts.ShortcutsPackage.includedPackages.contains(where: { type in
            type == ShortcutsModels.ShortcutsPackage.self
        }))
    }
}
