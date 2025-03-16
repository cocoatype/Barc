//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ViewPage: View {
    @Binding private var currentPage: Int
    init(currentPage: Binding<Int>) {
        _currentPage = currentPage
    }

    var body: some View {
        StandardPage(
            image: Asset.viewOnboarding.swiftUIImage,
            headline: Strings.ViewPage.headline,
            message: Strings.ViewPage.body,
            pageIndex: $currentPage
        )
    }
}

#Preview {
    ViewPage(currentPage: .constant(4))
}
