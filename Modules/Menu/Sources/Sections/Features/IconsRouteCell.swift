//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct IconsRouteCell: View {
    var body: some View {
        RouteCell(
            title: Strings.IconsRouteCell.title,
            image: Asset.about.swiftUIImage,
            route: .icons
        )
    }
}
