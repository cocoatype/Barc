//  Created by Geoff Pado on 10/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterLinkSeparator: View {
    var body: some View {
        Text(verbatim: " — ")
            .accessibilityHidden(true)
            .font(.footnote)
            .tint(.primary)
    }
}
