//  Created by Geoff Pado on 12/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct FacebookExternalURLCell: View {
    var body: some View {
        ExternalURLCell(
            title: Strings.FacebookExternalURLCell.title,
            subtitle: Strings.FacebookExternalURLCell.subtitle,
            image: Asset.facebook.swiftUIImage,
            urlString: "https://getbarc.app/contact/facebook/"
        )
    }
}

#Preview {
    FacebookExternalURLCell()
}
