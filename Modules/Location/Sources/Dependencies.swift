//  Created by Geoff Pado on 5/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

public extension Container {
    var locationProvider: Factory<any LocationProvider> {
        Factory(self) {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
                PreviewLocationProvider()
            } else {
                CoreLocationProvider()
            }
        }
    }
}
