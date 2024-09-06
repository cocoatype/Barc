//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Permission
import SwiftUI

struct TagPage: View {
    @Environment(\.advance) private var advance
    private let locationPermissionRequester = Permission.locationPermissionRequester

    var body: some View {
        StandardPage(
            imageLight: OnboardingAsset.tagOnboarding.swiftUIImage,
            imageDark: OnboardingAsset.tagOnboardingDark.swiftUIImage,
            headline: OnboardingStrings.TagPage.headline,
            message: OnboardingStrings.TagPage.body,
            pageIndex: 1
        ) {
            _ = await locationPermissionRequester.requestPermission()
        }
    }
}

#Preview {
    TagPage()
}
