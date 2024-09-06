//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct DebigulatorAppCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.DebigulatorAppCell.title,
            subtitle: MenuStrings.DebigulatorAppCell.subtitle,
            route: .privacy
        )
    }
}

#Preview {
    DebigulatorAppCell()
}
