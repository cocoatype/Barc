//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing
import ViewInspector

import BarcReleases

@testable import BarcMenu

@MainActor
struct CellLabelTests {
    @Test("When subtitle is not nil, contains two Texts")
    func subtitleText() throws {
        let label = CellLabel(title: "Title", subtitle: "Subtitle")
        let textCount = try label.inspect().findAll(Text.self).count

        #expect(textCount == 2)
    }

    @Test("When subtitle is nil, only one Text")
    func nilSubtitleText() throws {
        let label = CellLabel(title: "Title")
        let textCount = try label.inspect().findAll(Text.self).count

        #expect(textCount == 1)
    }

    @Test("When isBadged is true, show badge")
    func badgeIsShown() throws {
        let label = CellLabel(title: "Title", isBadged: true)
        let badgeCount = try label.inspect().findAll(NewReleaseBadge.self).count

        #expect(badgeCount == 1)
    }

    @Test("When isBadged is false, hide badge")
    func badgeIsHidden() throws {
        let label = CellLabel(title: "Title", isBadged: false)
        let badgeCount = try label.inspect().findAll(NewReleaseBadge.self).count

        #expect(badgeCount == 0)
    }
}
