//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ViewPage: View {
    @Environment(\.advance) private var advance
    var body: some View {
        StandardPage(
            imageLight: Asset.viewOnboarding.swiftUIImage,
            imageDark: Asset.viewOnboardingDark.swiftUIImage,
            headline: OnboardingStrings.ViewPage.headline,
            message: OnboardingStrings.ViewPage.body,
            pageIndex: 3
        )
    }
}

#Preview {
    ViewPage()
}
