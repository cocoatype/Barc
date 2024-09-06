//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ReviewRouteCell: View {
    var body: some View {
        ExternalURLCell(
            title: MenuStrings.ReviewRouteCell.title,
            subtitle: MenuStrings.ReviewRouteCell.subtitle,
            image: MenuAsset.appStore.swiftUIImage,
            urlString: "https://itunes.apple.com/us/app/barc/id6642707689?mt=8&action=write-review"
        )
    }
}

#Preview {
    ReviewRouteCell()
}
