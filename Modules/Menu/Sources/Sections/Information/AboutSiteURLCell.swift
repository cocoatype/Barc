//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AboutSiteURLCell: View {
    var body: some View {
        SiteURLCell(
            title: Strings.AboutSiteURLCell.title,
            image: Asset.about.swiftUIImage,
            path: "/about/"
        )
    }
}

#Preview {
    AboutSiteURLCell()
}
