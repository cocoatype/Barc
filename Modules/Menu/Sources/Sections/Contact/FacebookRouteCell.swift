//  Created by Geoff Pado on 12/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct FacebookRouteCell: View {
    var body: some View {
        ExternalURLCell(
            title: Strings.FacebookRouteCell.title,
            subtitle: Strings.FacebookRouteCell.subtitle,
            image: Asset.facebook.swiftUIImage,
            urlString: "https://getbarc.app/contact/facebook/"
        )
    }
}

#Preview {
    FacebookRouteCell()
}
