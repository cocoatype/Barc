//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Releases
import SwiftUI
import TestHelpersInterface
import Testing
import ViewInspector

@testable import Menu

@MainActor
struct SiteURLCellTests {
    @Test("Display sheet when button tapped")
    func sheetDisplayedWhenButtonTapped() async throws {
        let cell = SiteURLCell(
            title: "Title",
            image: Image(decorative: Asset.about),
            path: "/"
        )

        ViewHosting.host(view: cell)
        defer { ViewHosting.expel() }

        try await cell.inspection.inspect { inspectedCell in
            let actualCell = try inspectedCell.actualView()
            #expect(actualCell.isWebViewPresented == false)

            let button = try inspectedCell
                .implicitAnyView()
                .button()

            try button.tap()
            #expect(actualCell.isWebViewPresented == true)
        }
    }

    @Test("When isBadged is true, show badge")
    func badgeIsShown() throws {
        let cell = SiteURLCell(
            title: "Title",
            isBadged: true,
            image: Asset.about.swiftUIImage,
            path: "/"
        )
        let badgeCount = try cell.inspect().findAll(NewReleaseBadge.self).count

        #expect(badgeCount == 1)
    }

    @Test("When isBadged is false, hide badge")
    func badgeIsHidden() throws {
        let cell = SiteURLCell(
            title: "Title",
            isBadged: false,
            image: Asset.about.swiftUIImage,
            path: "/"
        )
        let badgeCount = try cell.inspect().findAll(NewReleaseBadge.self).count

        #expect(badgeCount == 0)
    }
}
