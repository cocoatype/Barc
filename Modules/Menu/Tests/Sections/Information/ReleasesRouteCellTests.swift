//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing
import ViewInspector

import BarcDefaults
import BarcDefaultsDoubles
import BarcReleases
import BarcReleasesDoubles

@testable import BarcMenu

@MainActor
struct ReleasesRouteCellTests {
    @Test("Uses correct subtitle for version")
    func subtitleForVersion() throws {
        let cell = ReleasesRouteCell(
            defaultsProvider: StubDefaultsProvider(),
            versionProvider: StubVersionProvider(version: "99.0")
        )

        let inspectedCell = try cell.inspect()
        _ = try inspectedCell.find(text: "Version 99.0")
        let textCount = inspectedCell.findAll(Text.self).count
        #expect(textCount == 2)
    }

    @Test("Uses correct subtitle for nil version")
    func subtitleForNilVersion() throws {
        let cell = ReleasesRouteCell(
            defaultsProvider: StubDefaultsProvider(),
            versionProvider: StubVersionProvider(version: nil)
        )

        let inspectedCell = try cell.inspect()
        let cellLabel = try inspectedCell.find(CellLabel.self)
        let allTexts = cellLabel.findAll(Text.self)
        let textCount = allTexts.count

        #expect(textCount == 1)
    }

    @Test("Shows badge if new release available")
    func showsBadgeIfNewReleaseAvailable() async throws {
        let cell = ReleasesRouteCell(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: "100.0")
        )

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }

        try await cell.inspection.inspect { inspectedCell in
            let badgeCount =  inspectedCell.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 1)
        }
    }

    @Test("Hides badge if no new release")
    func hidesBadgeIfNoNewRelease() async throws {
        let cell = ReleasesRouteCell(
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: "99.0")
        )

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }

        try await cell.inspection.inspect { inspectedCell in
            let badgeCount =  inspectedCell.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 0)
        }
    }

    @Test("Updates last seen version number on appearance")
    func updatesLastSeenVersionNumberOnAppearance() async throws {
        let defaultsProvider = StubDefaultsProvider(lastSeenVersion: "1.0")
        let versionProvider = StubVersionProvider(version: "99.0")
        let cell = ReleasesRouteCell(
            defaultsProvider: defaultsProvider,
            versionProvider: versionProvider
        )

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }
        
        try await cell.inspection.inspect { _ in
            await #expect(defaultsProvider.value(for: Keys.lastSeenVersion) == "99.0")
        }
    }
}
