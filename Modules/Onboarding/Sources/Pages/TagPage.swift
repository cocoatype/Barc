//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Permission
import SwiftUI

struct TagPage: View {
    @Environment(\.advance) private var advance

    var body: some View {
        StandardPage(
            image: Asset.tagOnboarding.swiftUIImage,
            headline: OnboardingStrings.TagPage.headline,
            message: OnboardingStrings.TagPage.body,
            pageIndex: .constant(1)
        )
    }
}

#Preview {
    TagPage()
}
