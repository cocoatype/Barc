//  Created by Geoff Pado on 5/6/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI
import WidgetKit

struct ComplicationView: View {
    private let codeID: String
    init(codeID: String) {
        self.codeID = codeID
    }

    var body: some View {
        // bangFirst by @KaenAitch on 2025-03-19
        // the default complication image
        Asset.bangFirst.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .codeURL(codeID)
    }
}

#Preview("Small", traits: .fixedLayout(width: 47, height: 47)) {
    ComplicationView(
        codeID: ""
    )
}
