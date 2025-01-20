//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Releases
import SwiftUI

struct ReleasesRouteCell: View {
    private let versionProvider: VersionProvider
    init(versionProvider: VersionProvider) {
        self.versionProvider = versionProvider
    }

    var body: some View {
        SiteURLCell(
            title: MenuStrings.ReleasesRouteCell.title,
            subtitle: subtitle,
            isBadged: true,
            image: Image(decorative: Asset.releases),
            path: path
        )
    }

    private var subtitle: String? {
        guard let versionNumber = versionProvider.version else { return nil }
        return MenuStrings.ReleasesRouteCell.subtitle(versionNumber)
    }

    private var path: String {
        guard let versionNumber = versionProvider.version else { return "releases/" }
        return "releases/\(versionNumber)/"
    }
}

#Preview {
    ReleasesRouteCell(versionProvider: PreviewVersionProvider())
}
