//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PrivacyRouteCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.PrivacyRouteCell.title,
            route: .privacy
        )
    }
}

#Preview {
    PrivacyRouteCell()
}
