//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDefaults
import BarcErrorHandling
import BarcLogging
import BarcReleases

struct InformationSection: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
        self.logger = logger
    }

    var body: some View {
        Section(Strings.InformationSection.title) {
            ReleasesRouteCell(
                defaultsProvider: defaultsProvider,
                versionProvider: versionProvider
            )
            AboutRouteCell()
            PrivacyRouteCell()
            AcknowledgementsRouteCell()
            OnboardingRouteCell(
                errorHandler: errorHandler,
                logger: logger
            )
        }
    }
}

#Preview {
    InformationSection(
        defaultsProvider: PreviewDefaultsProvider(),
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    )
}
