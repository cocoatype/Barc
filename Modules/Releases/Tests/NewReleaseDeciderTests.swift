//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

import BarcDefaults
import BarcDefaultsDoubles
import BarcReleasesDoubles

@testable import BarcReleases

@Suite(.container)
struct NewReleaseDeciderTests {
    @Test("returns false if no last seen version")
    func returnsFalseIfNoLastSeenVersion() async {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: nil) }
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }

        #expect(await NewReleaseDecider().shouldShowNewReleaseBadge() == false)
    }

    @Test("returns false if no current version")
    func returnsFalseIfNoCurrentVersion() async {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: nil) }

        #expect(await NewReleaseDecider().shouldShowNewReleaseBadge() == false)
    }

    @Test("returns false if versions match")
    func returnsFalseIfVersionsMatch() async {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }

        #expect(await NewReleaseDecider().shouldShowNewReleaseBadge() == false)
    }

    @Test("returns true if current version newer")
    func returnsTrueIfCurrentVersionNewer() async {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "100.0") }

        #expect(await NewReleaseDecider().shouldShowNewReleaseBadge() == true)
    }

    @Test("returns true if current version older")
    func returnsTrueIfCurrentVersionOlder() async {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: "100.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }

        #expect(await NewReleaseDecider().shouldShowNewReleaseBadge() == true)
    }
}
