//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import Shortcuts
import SwiftUI
import WidgetContents
import WidgetKit

@main
struct WidgetsBundle: WidgetBundle {
    var body: some Widget {
        CodeDisplayWidget()
    }
}

struct WidgetsIntentsPackage: AppIntentsPackage {
    static var includedPackages: [any AppIntentsPackage.Type] {
        [
            ShortcutsPackage.self,
        ]
    }
}
