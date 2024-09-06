//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ReviewRouteCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.ReviewRouteCell.title,
            subtitle: MenuStrings.ReviewRouteCell.subtitle,
            route: .privacy
        )
    }
}

#Preview {
    ReviewRouteCell()
}
