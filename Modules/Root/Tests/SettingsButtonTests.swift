//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import DefaultsDoubles
import Navigation
import Releases
import ReleasesDoubles
import SwiftUI
import Testing
import ViewInspector

@testable import Root

@MainActor
struct SettingsButtonTests {
    @Test("Tapping button updates sheet route")
    func tappingButtonUpdatesSheetRoute() async throws {
        let sheetRoute = Binding<Route?>(wrappedValue: nil)
        let button = SettingsButton(
            sheetRoute: sheetRoute,
            defaultsProvider: StubDefaultsProvider(),
            versionProvider: StubVersionProvider()
        )

        ViewHosting.host(view: button)
        defer { ViewHosting.expel() }

        try button.inspect().implicitAnyView().button().tap()
        #expect(sheetRoute.wrappedValue == .menu)
    }

    @Test("Shows badge if new release available")
    func showsBadgeIfNewReleaseAvailable() async throws {
        let button = SettingsButton(
            sheetRoute: .constant(nil),
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: "100.0")
        )

        ViewHosting.host(view: button)
        defer { ViewHosting.expel() }

        try await button.inspection.inspect { inspectedButton in
            let badgeCount = inspectedButton
                .findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 1)
        }
    }

    @Test("Hides badge if no new release")
    func hidesBadgeIfNoNewRelease() async throws {
        let button = SettingsButton(
            sheetRoute: .constant(nil),
            defaultsProvider: StubDefaultsProvider(lastSeenVersion: "99.0"),
            versionProvider: StubVersionProvider(version: "99.0")
        )

        ViewHosting.host(view: button)
        defer { ViewHosting.expel() }

        try await button.inspection.inspect { inspectedButton in
            let badgeCount =  inspectedButton.findAll(NewReleaseBadge.self).count

            #expect(badgeCount == 0)
        }
    }
}
