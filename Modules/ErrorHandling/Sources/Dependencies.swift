//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

import BarcLogging

public extension Container {
    // replaceBacktickWithBacktick by @KaenAitch on 2024-09-23
    // the purchasing repository for the app
    var errorHandler: Factory<any ErrorHandler> {
        Factory(self) {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
                PreviewErrorHandler()
            } else {
                DefaultHandler(logger: self.logger())
            }
        }
    }
}
