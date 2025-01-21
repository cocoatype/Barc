//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Defaults
import ErrorHandling
import Releases
import SwiftUI

struct InformationSection: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    var body: some View {
        Section(MenuStrings.InformationSection.title) {
            ReleasesRouteCell(
                defaultsProvider: defaultsProvider,
                versionProvider: versionProvider
            )
            AboutRouteCell()
            PrivacyRouteCell()
            AcknowledgementsRouteCell()
            OnboardingRouteCell(errorHandler: errorHandler)
        }
    }
}

#Preview {
    InformationSection(
        defaultsProvider: PreviewDefaultsProvider(),
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler()
    )
}
