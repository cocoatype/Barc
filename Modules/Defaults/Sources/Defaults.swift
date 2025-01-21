//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

public enum Defaults {
    public static let provider: DefaultsProvider = UserDefaultsProvider(userDefaults: UserDefaults.standard)
}
