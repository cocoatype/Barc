//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct HighlighterAppCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.HighlighterAppCell.title,
            subtitle: MenuStrings.HighlighterAppCell.subtitle,
            route: .privacy
        )
    }
}

#Preview {
    HighlighterAppCell()
}
