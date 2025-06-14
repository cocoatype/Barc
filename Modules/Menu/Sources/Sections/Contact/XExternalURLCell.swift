//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct XExternalURLCell: View {
    var body: some View {
        ExternalURLCell(
            title: Strings.XExternalURLCell.title,
            subtitle: Strings.XExternalURLCell.subtitle,
            image: Asset.x.swiftUIImage,
            urlString: "https://getbarc.app/contact/x/"
        )
    }
}

#Preview {
    XExternalURLCell()
}
