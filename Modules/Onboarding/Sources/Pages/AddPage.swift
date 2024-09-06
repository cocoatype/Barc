//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Permission
import SwiftUI

struct AddPage: View {
    private let requester = Permission.cameraPermissionRequester
    var body: some View {
        StandardPage(
            imageLight: OnboardingAsset.addOnboarding.swiftUIImage,
            imageDark: OnboardingAsset.addOnboardingDark.swiftUIImage,
            headline: OnboardingStrings.AddPage.headline,
            message: LocalizedStringKey("AddPage.body\(Image(systemName: "plus"))\(Image(systemName: "barcode.viewfinder"))"),
            pageIndex: 0
        ) {
            _ = await requester.requestPermission()
        }
    }
}

#Preview {
    AddPage()
}
