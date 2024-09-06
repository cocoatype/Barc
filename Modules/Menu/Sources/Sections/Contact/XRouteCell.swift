//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct XRouteCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.XRouteCell.title,
            subtitle: MenuStrings.XRouteCell.subtitle,
            route: .privacy
        )
    }
}

#Preview {
    XRouteCell()
}
