//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Defaults

public struct NewReleaseDecider {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider

    public init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
    }

    public func shouldShowNewReleaseBadge() async -> Bool {
        guard let lastSeenVersion = await defaultsProvider.value(for: Keys.lastSeenVersion),
              let currentVersion = versionProvider.version
        else { return false }

        return lastSeenVersion != currentVersion
    }
}
