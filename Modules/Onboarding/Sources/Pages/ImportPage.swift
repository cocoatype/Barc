//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ImportPage: View {
    @Binding private var currentPage: Int
    init(currentPage: Binding<Int>) {
        _currentPage = currentPage
    }

    var body: some View {
        StandardPage(
            image: Asset.importOnboarding.swiftUIImage,
            headline: Strings.ImportPage.headline,
            message: LocalizedStringKey("ImportPage.body\(Image(systemName: "square.and.arrow.up"))"),
            pageIndex: $currentPage
        )
    }
}

#Preview {
    ImportPage(currentPage: .constant(3))
}
