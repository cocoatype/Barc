//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct DisabledCell: View {
    private let title: String
    private let subtitle: String?
    private let image: Image

    init(title: String, subtitle: String? = nil, image: Image) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }

    var body: some View {
        Button {} label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(title: title, subtitle: subtitle, image: image)
            }
        }
    }
}

#Preview {
    DisabledCell(title: "Hello!", image: Asset.appStore.swiftUIImage)
}
