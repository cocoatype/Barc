//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ThreadsExternalURLCell: View {
    var body: some View {
        ExternalURLCell(
            title: Strings.ThreadsExternalURLCell.title,
            subtitle: Strings.ThreadsExternalURLCell.subtitle,
            image: Asset.threads.swiftUIImage,
            urlString: "https://getbarc.app/contact/threads/"
        )
    }
}

#Preview {
    ThreadsExternalURLCell()
}
