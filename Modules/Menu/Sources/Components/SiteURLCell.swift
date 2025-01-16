//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Web

struct SiteURLCell: View {
    private let title: String
    private let subtitle: String?
    private let isBadged: Bool
    private let image: Image
    private let url: URL

    init(
        title: String,
        subtitle: String? = nil,
        isBadged: Bool = false,
        image: Image,
        path: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.isBadged = isBadged
        self.image = image
        self.url = URL(websitePath: path)
    }

    @State private var isWebViewPresented = false
    var body: some View {
        Button {
            isWebViewPresented = true
        } label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(title: title, subtitle: subtitle, isBadged: isBadged, image: image)
            }
        }.sheet(isPresented: $isWebViewPresented) {
            WebView(url: url)
        }
    }
}

#Preview {
    SiteURLCell(title: "Hello!", image: Asset.appStore.swiftUIImage, path: "/")
}
