//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ImportPage: View {
    @Environment(\.advance) private var advance
    var body: some View {
        StandardPage(
            imageLight: OnboardingAsset.importOnboarding.swiftUIImage,
            imageDark: OnboardingAsset.importOnboardingDark.swiftUIImage,
            headline: OnboardingStrings.ImportPage.headline,
            message: OnboardingStrings.ImportPage.body,
            pageIndex: 2
        )
    }
}

#Preview {
    ImportPage()
}
