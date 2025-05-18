//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import BarcDefaultsDoubles
import BarcRouting
import BarcReleases
import BarcReleasesDoubles

@testable import BarcRoot

@MainActor
@Suite(.container)
struct SettingsButtonTests {
    @Test("Tapping button updates sheet route")
    func tappingButtonUpdatesSheetRoute() async throws {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider() }
        Container.shared.versionProvider.register { StubVersionProvider() }
        let sheetRoute = Binding<Route?>(wrappedValue: nil)
        let button = SettingsButton(sheetRoute: sheetRoute)

        ViewHosting.host(view: button)
        defer { ViewHosting.expel() }

        try button.inspect().find(viewWithAccessibilityIdentifier: "SettingsButton").button().tap()
        #expect(sheetRoute.wrappedValue == .menu)
    }

    @Test("Shows badge if new release available")
    func showsBadgeIfNewReleaseAvailable() async throws {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "100.0") }
        let button = SettingsButton(sheetRoute: .constant(nil))

        ViewHosting.host(view: button)
        defer { ViewHosting.expel() }

        try await button.inspection.inspect { inspectedButton in
            let badgeCount =  inspectedButton.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 1)
        }
    }

    @Test("Hides badge if no new release")
    func hidesBadgeIfNoNewRelease() async throws {
        Container.shared.defaultsProvider.register { @MainActor in StubDefaultsProvider(lastSeenVersion: "99.0") }
        Container.shared.versionProvider.register { StubVersionProvider(version: "99.0") }
        let button = SettingsButton(sheetRoute: .constant(nil))

        ViewHosting.host(view: button)
        defer { ViewHosting.expel() }

        try await button.inspection.inspect { inspectedButton in
            let badgeCount =  inspectedButton.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 0)
        }
    }
}
