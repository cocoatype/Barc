//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AppStoreCell: View {
    private let title: String
    private let subtitle: String?
    private let image: Image
    private let url: URL

    init(title: String, subtitle: String? = nil, image: Image, appID: StaticString) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.url = URL(appID: appID)
    }

    var body: some View {
        Button {
            UIApplication.shared.open(url)
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
    AppStoreCell(title: "Hello!", image: MenuAsset.appStore.swiftUIImage, appID: "6642707689")
}
