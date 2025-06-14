//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AcknowledgementsSiteURLCell: View {
    var body: some View {
        SiteURLCell(
            title: Strings.AcknowledgementsSiteURLCell.title,
            image: Asset.acknowledgements.swiftUIImage,
            path: "/acknowledgements/"
        )
    }
}

#Preview {
    AcknowledgementsSiteURLCell()
}
