//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ImportPage: View {
    @Environment(\.advance) private var advance
    var body: some View {
        StandardPage(
            imageLight: Asset.importOnboarding.swiftUIImage,
            imageDark: Asset.importOnboardingDark.swiftUIImage,
            headline: OnboardingStrings.ImportPage.headline,
            message: LocalizedStringKey("ImportPage.body\(Image(systemName: "square.and.arrow.up"))"),
            pageIndex: 2
        )
    }
}

#Preview {
    ImportPage()
}
