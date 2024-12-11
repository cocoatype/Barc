//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ThreadsRouteCell: View {
    var body: some View {
        ExternalURLCell(
            title: MenuStrings.ThreadsRouteCell.title,
            subtitle: MenuStrings.ThreadsRouteCell.subtitle,
            image: Asset.threads.swiftUIImage,
            urlString: "https://getbarc.app/contact/threads/"
        )
    }
}

#Preview {
    ThreadsRouteCell()
}
