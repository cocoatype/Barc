//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

@testable import Defaults

public actor StubDefaultsProvider: DefaultsProvider {
    private var backingData = [String: Any]()
    public init(
        hasSeenOnboarding: Bool = false,
        lastSeenVersion: String? = nil
    ) {
        backingData[Keys.hasSeenOnboarding.value] = hasSeenOnboarding
        backingData[Keys.lastSeenVersion.value] = lastSeenVersion
    }

    public func value(for key: Key<String>) -> String? {
        backingData[key.value] as? String
    }

    public func value(for key: Key<Bool>) -> Bool {
        backingData[key.value] as? Bool ?? false
    }

    public func set(_ value: Bool, for key: Key<Bool>) {
        backingData[key.value] = value
    }

    public func set(_ value: String?, for key: Key<String>) {
        backingData[key.value] = value
    }
}
