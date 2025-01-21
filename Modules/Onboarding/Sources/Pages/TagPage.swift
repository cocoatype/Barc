//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Permission
import SwiftUI

struct TagPage: View {
    @Binding private var currentPage: Int
    init(currentPage: Binding<Int>) {
        _currentPage = currentPage
    }

    var body: some View {
        StandardPage(
            image: Asset.tagOnboarding.swiftUIImage,
            headline: OnboardingStrings.TagPage.headline,
            message: OnboardingStrings.TagPage.body,
            pageIndex: $currentPage
        )
    }
}

#Preview {
    TagPage(currentPage: .constant(2))
}
