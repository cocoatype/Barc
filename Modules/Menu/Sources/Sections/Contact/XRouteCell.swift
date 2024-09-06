//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct XRouteCell: View {
    var body: some View {
        ExternalURLCell(
            title: MenuStrings.XRouteCell.title,
            subtitle: MenuStrings.XRouteCell.subtitle,
            urlString: "https://x.com/barccodes"
        )
    }
}

#Preview {
    XRouteCell()
}
