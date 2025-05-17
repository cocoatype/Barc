//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing
import ViewInspector

import FactoryKit
import FactoryTesting

import BarcDefaults
import BarcDefaultsDoubles
import BarcReleases
import BarcReleasesDoubles

@testable import BarcMenu

@MainActor @Suite(.container)
struct ReleasesRouteCellTests {
    @Test("Uses correct subtitle for version")
    func subtitleForVersion() throws {
        Container.shared.defaultsProvider.register { StubDefaultsProvider() }
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }
        let cell = ReleasesRouteCell()

        let inspectedCell = try cell.inspect()
        _ = try inspectedCell.find(text: "Version 99.0")
        let textCount = inspectedCell.findAll(Text.self).count
        #expect(textCount == 2)
    }

    @Test("Uses correct subtitle for nil version")
    func subtitleForNilVersion() throws {
        Container.shared.defaultsProvider.register { StubDefaultsProvider() }
        Container.shared.versionProvider.register { StubVersionProvider(version: nil) }
        let cell = ReleasesRouteCell()

        let inspectedCell = try cell.inspect()
        let cellLabel = try inspectedCell.find(CellLabel.self)
        let allTexts = cellLabel.findAll(Text.self)
        let textCount = allTexts.count

        #expect(textCount == 1)
    }

    @Test("Shows badge if new release available")
    func showsBadgeIfNewReleaseAvailable() async throws {
        Container.shared.defaultsProvider.register { StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "100.0") }
        let cell = ReleasesRouteCell()

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }

        let shouldBeBadged = await NewReleaseDecider().shouldShowNewReleaseBadge()
        #expect(shouldBeBadged == true)

        try await cell.inspection.inspect { inspectedCell in
            let badgeCount =  inspectedCell.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 1)
        }
    }

    @Test("Hides badge if no new release")
    func hidesBadgeIfNoNewRelease() async throws {
        Container.shared.defaultsProvider.register { StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }
        let cell = ReleasesRouteCell()

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }

        try await cell.inspection.inspect { inspectedCell in
            let badgeCount =  inspectedCell.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 0)
        }
    }

    @Test("Updates last seen version number on appearance")
    func updatesLastSeenVersionNumberOnAppearance() async throws {
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }
        let defaultsProvider = StubDefaultsProvider(lastSeenVersion: "1.0")
        Container.shared.defaultsProvider.register { defaultsProvider }
        let cell = ReleasesRouteCell()

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }
        
        try await cell.inspection.inspect { _ in
            await #expect(defaultsProvider.value(for: Keys.lastSeenVersion) == "99.0")
        }
    }
}
