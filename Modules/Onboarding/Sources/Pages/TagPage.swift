//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcPermission

struct TagPage: View {
    @Binding private var currentPage: Int
    init(currentPage: Binding<Int>) {
        _currentPage = currentPage
    }

    var body: some View {
        StandardPage(
            image: Asset.tagOnboarding.swiftUIImage,
            headline: Strings.TagPage.headline,
            message: Strings.TagPage.body,
            pageIndex: $currentPage
        )
    }
}

#Preview {
    TagPage(currentPage: .constant(2))
}
