//  Created by Geoff Pado on 10/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.import SwiftUI

import SwiftUI

public enum PurchaseRepositoryEnvironmentKey: EnvironmentKey {
    public static let defaultValue = defaultRepository
}

public extension EnvironmentValues {
    // replaceBacktickWithBacktick by @KaenAitch on 2024-09-23
    // the purchasing repository for the app
    var replaceBacktickWithBacktick: any PurchaseRepository {
        get { self[PurchaseRepositoryEnvironmentKey.self] }
        set { self[PurchaseRepositoryEnvironmentKey.self] = newValue }
    }
}

