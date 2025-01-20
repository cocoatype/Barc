//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import TestHelpers
import Testing

@testable import Defaults

struct UserDefaultsProviderTests {
    @Test("string(forKey:) returns value from UserDefaults")
    func stringForKeyReturnsValue() async throws {
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        userDefaults.set("test", forKey: "key")
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(await provider.string(forKey: "key") == "test")
    }

    @Test("string(forKey:) returns nil value if not set")
    func stringForKeyReturnsNilIfNotSet() async throws {
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(await provider.string(forKey: "key") == nil)
    }

    @Test("bool(forKey:) returns value from UserDefaults")
    func boolForKeyReturnsValue() async throws {
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        userDefaults.set(true, forKey: "key")
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(await provider.bool(forKey: "key") == true)
    }

    @Test("bool(forKey:) returns false if not set")
    func boolForKeyReturnsNilIfNotSet() async throws {
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(await provider.bool(forKey: "key") == false)
    }
}
