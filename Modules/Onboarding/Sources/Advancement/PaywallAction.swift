//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallAction {
    private let action: () -> Void
    init(action: @escaping () -> Void) {
        self.action = action
    }

    func callAsFunction() {
        action()
    }
}

enum PaywallActionEnvironmentKey: EnvironmentKey {
    static let defaultValue: PaywallAction = PaywallAction {}
}

extension EnvironmentValues {
    var paywall: PaywallAction {
        get { self[PaywallActionEnvironmentKey.self] }
        set { self[PaywallActionEnvironmentKey.self] = newValue }
    }
}
