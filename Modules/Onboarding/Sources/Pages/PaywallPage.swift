//  Created by Geoff Pado on 12/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallPage: View {
    var body: some View {
        StandardPage(
            imageLight: Asset.paywallOnboarding.swiftUIImage,
            imageDark: Asset.paywallOnboarding.swiftUIImage,
            headline: OnboardingStrings.PaywallPage.headline,
            message: OnboardingStrings.PaywallPage.body,
            pageIndex: 4
        )
    }
}

#Preview {
    PaywallPage()
}
