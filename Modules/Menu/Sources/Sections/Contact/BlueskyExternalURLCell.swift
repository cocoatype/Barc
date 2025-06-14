//  Created by Geoff Pado on 12/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BlueskyExternalURLCell: View {
    var body: some View {
        ExternalURLCell(
            title: Strings.BlueskyExternalURLCell.title,
            subtitle: Strings.BlueskyExternalURLCell.subtitle,
            image: Asset.bluesky.swiftUIImage,
            urlString: "https://getbarc.app/contact/bluesky/"
        )
    }
}

#Preview {
    BlueskyExternalURLCell()
}
