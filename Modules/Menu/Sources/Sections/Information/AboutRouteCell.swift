//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AboutRouteCell: View {
    var body: some View {
        SiteURLCell(
            title: MenuStrings.AboutRouteCell.title,
            image: MenuAsset.about.swiftUIImage,
            path: "/about/"
        )
    }
}

#Preview {
    AboutRouteCell()
}
