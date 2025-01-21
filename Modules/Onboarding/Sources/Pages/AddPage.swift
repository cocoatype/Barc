//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Permission
import SwiftUI

struct AddPage: View {
    var body: some View {
        StandardPage(
            image: Asset.addOnboarding.swiftUIImage,
            headline: OnboardingStrings.AddPage.headline,
            message: LocalizedStringKey("AddPage.body\(Image(systemName: "plus"))\(Image(systemName: "barcode.viewfinder"))"),
            pageIndex: .constant(0)
        )
    }
}

#Preview {
    AddPage()
}
