//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import ShortcutsModels

public struct ShortcutsPackage: AppIntentsPackage {
    public static var includedPackages: [any AppIntentsPackage.Type] {
        [ShortcutsModels.ShortcutsPackage.self]
    }
}
