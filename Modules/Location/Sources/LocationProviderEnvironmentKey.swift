//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

public enum LocationProviderEnvironmentKey: EnvironmentKey {
    public static let defaultValue: any LocationProvider = CoreLocationProvider()
}

public extension EnvironmentValues {
    var locationProvider: any LocationProvider {
        get { self[LocationProviderEnvironmentKey.self] }
        set { self[LocationProviderEnvironmentKey.self] = newValue }
    }
}

