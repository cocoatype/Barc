//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Defaults
import DefaultsDoubles
import ReleasesDoubles
import Testing

@testable import Releases

struct NewReleaseDeciderTests {
    @Test("returns false if no last seen version")
    func returnsFalseIfNoLastSeenVersion() async {
        let decider = NewReleaseDecider(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: nil),
            versionProvider: StubVersionProvider(version: "99.0")
        )

        #expect(await decider.shouldShowNewReleaseBadge() == false)
    }

    @Test("returns false if no current version")
    func returnsFalseIfNoCurrentVersion() async {
        let decider = NewReleaseDecider(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: nil)
        )

        #expect(await decider.shouldShowNewReleaseBadge() == false)
    }

    @Test("returns false if versions match")
    func returnsFalseIfVersionsMatch() async {
        let decider = NewReleaseDecider(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: "99.0")
        )

        #expect(await decider.shouldShowNewReleaseBadge() == false)
    }

    @Test("returns true if current version newer")
    func returnsTrueIfCurrentVersionNewer() async {
        let decider = NewReleaseDecider(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: "100.0")
        )

        #expect(await decider.shouldShowNewReleaseBadge() == true)
    }

    @Test("returns true if current version older")
    func returnsTrueIfCurrentVersionOlder() async {
        let decider = NewReleaseDecider(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "100.0"),
            versionProvider: StubVersionProvider(version: "99.0")
        )

        #expect(await decider.shouldShowNewReleaseBadge() == true)
    }
}
