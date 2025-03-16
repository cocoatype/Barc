//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct HighlighterAppCell: View {
    var body: some View {
        AppStoreCell(
            title: Strings.HighlighterAppCell.title,
            subtitle: Strings.HighlighterAppCell.subtitle,
            image: Asset.highlighter.swiftUIImage,
            appID: "1215283742"
        )
    }
}

#Preview {
    HighlighterAppCell()
}
