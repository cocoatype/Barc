//  Created by Geoff Pado on 1/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Testing
import ViewInspector

@testable import Menu

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
}
