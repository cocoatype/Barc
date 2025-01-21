//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Defaults
import Releases
import SwiftUI
import TestHelpersInterface

struct ReleasesRouteCell: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
    }

    @State private var isBadged = false
    var body: some View {
        SiteURLCell(
            title: MenuStrings.ReleasesRouteCell.title,
            subtitle: subtitle,
            isBadged: isBadged,
            image: Image(decorative: Asset.releases),
            path: path
        ).task {
            isBadged = await isNewReleaseAvailable
            if let currentVersion = versionProvider.version {
                await defaultsProvider.set(currentVersion, for: Keys.lastSeenVersion)
            }
        }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }

    private var isNewReleaseAvailable: Bool {
        get async {
            let decider = NewReleaseDecider(
                defaultsProvider: defaultsProvider,
                versionProvider: versionProvider
            )
            return await decider.shouldShowNewReleaseBadge()
        }
    }

    private var subtitle: String? {
        guard let versionNumber = versionProvider.version else { return nil }
        return MenuStrings.ReleasesRouteCell.subtitle(versionNumber)
    }

    private var path: String {
        guard let versionNumber = versionProvider.version else { return "releases/" }
        return "releases/\(versionNumber)/"
    }

    // MARK: - Test Hooks
    let inspection = Inspection<Self>()
}

#Preview {
    ReleasesRouteCell(
        defaultsProvider: PreviewDefaultsProvider(),
        versionProvider: PreviewVersionProvider()
    )
}
