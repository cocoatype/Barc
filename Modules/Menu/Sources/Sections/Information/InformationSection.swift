//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct InformationSection: View {
    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        Section(MenuStrings.InformationSection.title) {
            ReleasesRouteCell()
            AboutRouteCell()
            PrivacyRouteCell()
            AcknowledgementsRouteCell()
            OnboardingRouteCell(errorHandler: errorHandler)
        }
    }
}

#Preview {
    InformationSection(errorHandler: PreviewErrorHandler())
}
