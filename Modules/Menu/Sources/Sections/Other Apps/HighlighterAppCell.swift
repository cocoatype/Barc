//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct HighlighterAppCell: View {
    var body: some View {
        AppStoreCell(
            title: MenuStrings.HighlighterAppCell.title,
            subtitle: MenuStrings.HighlighterAppCell.subtitle,
            image: MenuAsset.highlighter.swiftUIImage,
            appID: "1215283742"
        )
    }
}

#Preview {
    HighlighterAppCell()
}
