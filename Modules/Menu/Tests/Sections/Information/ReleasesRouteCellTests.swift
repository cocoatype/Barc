//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Releases
import SwiftUI
import Testing
import ViewInspector

@testable import Menu

@MainActor
struct ReleasesRouteCellTests {
    @Test("Uses correct subtitle for version")
    func subtitleForVersion() throws {
        struct StubVersionProvider: VersionProvider {
            var version: String? { "99.0" }
        }

        let versionProvider = StubVersionProvider()
        let cell = ReleasesRouteCell(versionProvider: versionProvider)

        let inspectedCell = try cell.inspect()
        _ = try inspectedCell.find(text: "Version 99.0")
        let textCount = inspectedCell.findAll(Text.self).count
        #expect(textCount == 2)
    }

    @Test("Uses correct subtitle for nil version")
    func subtitleForNilVersion() throws {
        struct StubVersionProvider: VersionProvider {
            var version: String? { nil }
        }

        let versionProvider = StubVersionProvider()
        let cell = ReleasesRouteCell(versionProvider: versionProvider)

        let inspectedCell = try cell.inspect()
        let cellLabel = try inspectedCell.find(CellLabel.self)
        let allTexts = cellLabel.findAll(Text.self)
        let textCount = allTexts.count

        #expect(textCount == 1)
    }
}
