//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

enum AdvanceActionEnvironmentKey: EnvironmentKey {
    static let defaultValue: AdvanceAction = AdvanceAction {}
}

extension EnvironmentValues {
    var advance: AdvanceAction {
        get { self[AdvanceActionEnvironmentKey.self] }
        set { self[AdvanceActionEnvironmentKey.self] = newValue }
    }
}
