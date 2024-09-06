//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ExternalURLCell: View {
    private let title: String
    private let subtitle: String?
    private let url: URL

    init(title: String, subtitle: String? = nil, urlString: StaticString) {
        self.title = title
        self.subtitle = subtitle
        self.url = URL(staticString: urlString)
    }

    var body: some View {
        Button {
            UIApplication.shared.open(url)
        } label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(title: title, subtitle: subtitle)
            }
        }
    }
}

#Preview {
    ExternalURLCell(title: "Hello!", urlString: "https://getbarc.app")
}
