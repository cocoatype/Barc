//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ReviewExternalURLCell: View {
    var body: some View {
        ExternalURLCell(
            title: Strings.ReviewExternalURLCell.title,
            subtitle: Strings.ReviewExternalURLCell.subtitle,
            image: Asset.appStore.swiftUIImage,
            urlString: "https://itunes.apple.com/us/app/barc/id6642707689?mt=8&action=write-review"
        )
    }
}

#Preview {
    ReviewExternalURLCell()
}
