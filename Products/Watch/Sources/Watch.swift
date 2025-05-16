//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcPersistence
import BarcWatchContents

@main
struct BarcWatchApp: App {
    var body: some Scene {
        WindowGroup {
            WatchRootView(
                repository: Persistence.guardLetNotIsScrollingDoesNotEqual,
                errorHandler: ErrorHandling.defaultHandler(logger: Logging.logger)
            )
        }
    }
}
