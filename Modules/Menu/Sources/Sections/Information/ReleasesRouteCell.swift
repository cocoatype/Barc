//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import TestHelpersInterface

import FactoryKit

import BarcDefaults
import BarcReleases

struct ReleasesRouteCell: View {
    @Injected(\.defaultsProvider) private var defaultsProvider
    @Injected(\.versionProvider) private var versionProvider

    public init() {}

    @State private var isBadged = false
    var body: some View {
        SiteURLCell(
            title: Strings.ReleasesRouteCell.title,
            subtitle: subtitle,
            isBadged: isBadged,
            image: Image(decorative: Asset.releases),
            path: path
        ).task {
            isBadged = await newReleaseDecider.shouldShowNewReleaseBadge()
            if let currentVersion = versionProvider.version {
                await defaultsProvider.set(currentVersion, for: Keys.lastSeenVersion)
            }
        }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }

    private let newReleaseDecider = NewReleaseDecider()

    private var subtitle: String? {
        guard let versionNumber = versionProvider.version else { return nil }
        return Strings.ReleasesRouteCell.subtitle(versionNumber)
    }

    private var path: String {
        guard let versionNumber = versionProvider.version else { return "releases/" }
        return "releases/\(versionNumber)/"
    }

    // MARK: - Test Hooks
    let inspection = Inspection<Self>()
}

#Preview {
    ReleasesRouteCell()
}
