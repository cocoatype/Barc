//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PrivacySiteURLCell: View {
    var body: some View {
        SiteURLCell(
            title: Strings.PrivacySiteURLCell.title,
            image: Asset.privacy.swiftUIImage,
            path: "/privacy/"
        )
    }
}

#Preview {
    PrivacySiteURLCell()
}
