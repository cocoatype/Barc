//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AboutRouteCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.AboutRouteCell.title,
            route: .about
        )
    }
}

#Preview {
    AboutRouteCell()
}
