//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct RouteCell: View {
    private let title: String
    private let subtitle: String?
    private let image: Image
    private let route: Route

    init(title: String, subtitle: String? = nil, image: Image, route: Route) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.route = route
    }

    var body: some View {
        NavigationLink(value: route) {
            CellLabel(title: title, subtitle: subtitle, image: image)
        }
    }
}

#Preview {
    RouteCell(
        title: "Hello",
        subtitle: "World",
        image: MenuAsset.tour.swiftUIImage,
        route: .onboarding
    )
}
