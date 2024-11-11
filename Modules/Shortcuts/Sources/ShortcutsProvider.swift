//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents

public struct ShortcutsProvider: AppShortcutsProvider {
    public static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenCodeIntent(),
            phrases: [
                "Open \(\.$target) in \(.applicationName)",
            ],
            shortTitle: "ShortcutsProvider.OpenCodeIntent.shortTitle",
            systemImageName: "barcode"
        )
    }
}
