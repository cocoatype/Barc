//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

public extension Container {
    var defaultsProvider: Factory<any DefaultsProvider> {
        Factory(self) {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil {
                PreviewDefaultsProvider()
            } else {
                UserDefaultsProvider(userDefaults: UserDefaults.standard)
            }
        }
    }
}
