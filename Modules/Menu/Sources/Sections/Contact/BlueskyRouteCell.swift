//  Created by Geoff Pado on 12/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BlueskyRouteCell: View {
    var body: some View {
        ExternalURLCell(
            title: MenuStrings.BlueskyRouteCell.title,
            subtitle: MenuStrings.BlueskyRouteCell.subtitle,
            image: Asset.bluesky.swiftUIImage,
            urlString: "https://getbarc.app/contact/bluesky/"
        )
    }
}

#Preview {
    BlueskyRouteCell()
}
