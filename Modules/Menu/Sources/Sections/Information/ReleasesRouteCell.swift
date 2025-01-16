//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ReleasesRouteCell: View {
    private let infoDictionary: [String: Any]?
    init(infoDictionary: [String: Any]? = Bundle.main.infoDictionary) {
        self.infoDictionary = infoDictionary
    }

    var body: some View {
        SiteURLCell(
            title: MenuStrings.ReleasesRouteCell.title,
            subtitle: subtitle,
            image: Asset.releases.swiftUIImage,
            path: path
        )
    }

    var subtitle: String? {
        guard let versionNumber else { return nil }
        return MenuStrings.ReleasesRouteCell.subtitle(versionNumber)
    }

    var path: String {
        guard let versionNumber else { return "releases/" }
        return "releases/\(versionNumber)/"
    }

    var versionNumber: String? {
        guard let infoDictionary,
              let version = infoDictionary["CFBundleShortVersionString"] as? String
        else { return nil }
        return version
    }
}

#Preview {
    ReleasesRouteCell(infoDictionary: ["CFBundleShortVersionString": "24.0"])
}
