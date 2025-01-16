//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Releases
import SwiftUI

struct InformationSection: View {
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    init(
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    var body: some View {
        Section(MenuStrings.InformationSection.title) {
            ReleasesRouteCell(versionProvider: versionProvider)
            AboutRouteCell()
            PrivacyRouteCell()
            AcknowledgementsRouteCell()
            OnboardingRouteCell(errorHandler: errorHandler)
        }
    }
}

#Preview {
    InformationSection(
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler()
    )
}
