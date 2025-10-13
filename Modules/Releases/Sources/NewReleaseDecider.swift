//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import FactoryKit

import BarcDefaults

@MainActor public struct NewReleaseDecider: Sendable {
    public init() {}

    @Injected(\.defaultsProvider) private var defaultsProvider
    @Injected(\.versionProvider) private var versionProvider
    public func shouldShowNewReleaseBadge() -> Bool {
        guard let lastSeenVersion = defaultsProvider.value(for: Keys.lastSeenVersion),
              let currentVersion = versionProvider.version
        else { return false }

        return lastSeenVersion != currentVersion
    }
}
