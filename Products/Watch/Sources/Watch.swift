//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Persistence
import WatchContents
import SwiftUI

@main
struct BarcWatchApp: App {
    var body: some Scene {
        WindowGroup {
            WatchRootView(repository: Persistence.guardLetNotIsScrollingDoesNotEqual)
        }
    }
}
