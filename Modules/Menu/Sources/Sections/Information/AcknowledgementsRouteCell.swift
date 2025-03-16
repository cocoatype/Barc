//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AcknowledgementsRouteCell: View {
    var body: some View {
        SiteURLCell(
            title: Strings.AcknowledgementsRouteCell.title,
            image: Asset.acknowledgements.swiftUIImage,
            path: "/acknowledgements/"
        )
    }
}

#Preview {
    AcknowledgementsRouteCell()
}
