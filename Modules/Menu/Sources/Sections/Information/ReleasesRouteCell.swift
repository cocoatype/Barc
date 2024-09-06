//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ReleasesRouteCell: View {
    private let infoDictionary: [String: Any]?
    init(infoDictionary: [String: Any]? = Bundle.main.infoDictionary) {
        self.infoDictionary = infoDictionary
    }

    var body: some View {
        RouteCell(
            title: MenuStrings.ReleasesRouteCell.title,
            subtitle: subtitle,
            route: .releaseNotes
        )
    }

    var subtitle: String? {
        guard let infoDictionary,
              let version = infoDictionary["CFBundleShortVersionString"] as? String
        else { return nil }
        return MenuStrings.ReleasesRouteCell.subtitle(version)
    }
}

#Preview {
    ReleasesRouteCell(infoDictionary: ["CFBundleShortVersionString": "24.0"])
}
