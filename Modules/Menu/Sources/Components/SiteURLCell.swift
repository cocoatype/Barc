//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct SiteURLCell: View {
    private let title: String
    private let subtitle: String?
    private let url: URL

    init(title: String, subtitle: String? = nil, path: StaticString) {
        self.title = title
        self.subtitle = subtitle
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
                CellLabel(title: title, subtitle: subtitle)
            }
        }.sheet(isPresented: $isWebViewPresented) {
            WebView(url: url)
        }
    }
}

#Preview {
    SiteURLCell(title: "Hello!", path: "/")
}
