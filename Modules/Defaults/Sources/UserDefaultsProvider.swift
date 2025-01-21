//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation

actor UserDefaultsProvider: DefaultsProvider {
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func value(for key: Key<Bool>) -> Bool {
        userDefaults.bool(forKey: key.value)
    }

    func set(_ value: Bool, for key: Key<Bool>) {
        userDefaults.set(value, forKey: key.value)
    }

    func value(for key: Key<String>) -> String? {
        userDefaults.string(forKey: key.value)
    }

    func set(_ value: String?, for key: Key<String>) {
        userDefaults.set(value, forKey: key.value)
    }

    // MARK: - Test Hooks

    let userDefaults: UserDefaults
    func perform<T>(_ op: @Sendable (isolated UserDefaultsProvider) throws -> sending T) rethrows -> sending T {
        try op(self)
    }
}
