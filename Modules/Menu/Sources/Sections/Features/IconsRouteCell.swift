//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct IconsRouteCell: View {
    nonisolated static let title = Strings.IconsRouteCell.title
    nonisolated static let image = Asset.icons.swiftUIImage

    var body: some View {
        RouteCell(
            title: IconsRouteCell.title,
            image: IconsRouteCell.image,
            route: .icons
        )
    }
}
