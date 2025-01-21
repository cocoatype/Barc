//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Defaults

public actor StubDefaultsProvider: DefaultsProvider {
    private let lastSeenVersion: String?
    public func value(for key: Key<String>) -> String? { lastSeenVersion }

    public init(
        lastSeenVersion: String? = nil
    ) {
        self.lastSeenVersion = lastSeenVersion
    }

    // no-ops
    public func value(for key: Key<Bool>) -> Bool { false }
    public func set(_ value: Bool, for key: Key<Bool>) {}
    public func set(_ value: String?, for key: Key<String>) {}
}
