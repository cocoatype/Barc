//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct RouteCell: View {
    private let title: String
    private let subtitle: String?
    private let route: Route

    init(title: String, subtitle: String? = nil, route: Route) {
        self.title = title
        self.subtitle = subtitle
        self.route = route
    }

    var body: some View {
        NavigationLink(value: route) {
            CellLabel(title: title, subtitle: subtitle)
        }
    }
}

#Preview {
    RouteCell(title: "Hello", subtitle: "World", route: .onboarding)
}
