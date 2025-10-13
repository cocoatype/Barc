//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

import BarcTestHelpers

@testable import BarcDefaults

@MainActor struct UserDefaultsProviderTests {
    @Test("value(for:) returns string value from UserDefaults")
    func valueForStringKeyReturnsValue() throws {
        let keyValue = "key"
        let key = Key<String>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        userDefaults.set("test", forKey: keyValue)
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(provider.value(for: key) == "test")
    }

    @Test("value(for:) returns nil value for string key if not set")
    func valueForStringKeyReturnsNilIfNotSet() throws {
        let keyValue = "key"
        let key = Key<String>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(provider.value(for: key) == nil)
    }

    @Test("set(_:for:) sets value for string key")
    func setValueForStringKeySetsValue() throws {
        let keyValue = "key"
        let key = Key<String>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        provider.set("test", for: key)
        let value = provider.userDefaults.string(forKey: keyValue)
        #expect(value == "test")
    }

    @Test("set(_:for:) sets nil value for string key")
    func setValueForStringKeySetsNilValue() throws {
        let keyValue = "key"
        let key = Key<String>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        provider.set(nil, for: key)
        let value = provider.userDefaults.string(forKey: keyValue)
        #expect(value == nil)
    }

    @Test("value(for:) returns bool value from UserDefaults")
    func valueForBoolKeyReturnsValue() throws {
        let keyValue = "key"
        let key = Key<Bool>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        userDefaults.set(true, forKey: keyValue)
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(provider.value(for: key) == true)
    }

    @Test("value(for:) returns false for bool key if not set")
    func valueForBoolKeyReturnsFalseIfNotSet() throws {
        let keyValue = "key"
        let key = Key<Bool>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        #expect(provider.value(for: key) == false)
    }

    @Test("set(_:for:) sets value for bool key")
    func setValueForBoolKeySetsValue() throws {
        let keyValue = "key"
        let key = Key<Bool>(value: keyValue)
        let userDefaults = try UserDefaults(suiteName: UUID().uuidString).unwrapped
        let provider = UserDefaultsProvider(userDefaults: userDefaults)

        provider.set(true, for: key)
        let value = provider.userDefaults.bool(forKey: keyValue)
        #expect(value == true)
    }
}
