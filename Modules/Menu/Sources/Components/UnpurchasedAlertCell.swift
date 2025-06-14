//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct UnpurchasedAlertCell: View {
    private let title: String
    private let subtitle: String?
    private let image: Image
    @Binding private var shouldShowAlert: Bool

    init(
        title: String,
        subtitle: String? = nil,
        image: Image,
        shouldShowAlert: Binding<Bool>
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        _shouldShowAlert = shouldShowAlert
    }

    var body: some View {
        Button {
            shouldShowAlert = true
        } label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(title: title, subtitle: subtitle, image: image)
            }
        }
    }
}

#Preview {
    UnpurchasedAlertCell(
        title: "Hello!",
        image: Asset.appStore.swiftUIImage,
        shouldShowAlert: .constant(false)
    )
}
