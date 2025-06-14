//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct InformationSection: View {
    var body: some View {
        Section(Strings.InformationSection.title) {
            ReleasesSiteURLCell()
            AboutSiteURLCell()
            PrivacySiteURLCell()
            AcknowledgementsSiteURLCell()
            OnboardingPresentationCell()
        }
    }
}

#Preview {
    InformationSection()
}
