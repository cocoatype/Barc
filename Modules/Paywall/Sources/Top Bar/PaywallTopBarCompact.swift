//  Created by Geoff Pado on 2/2/22.
//  Copyright © 2022 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct PaywallTopBarCompact: View {
    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PaywallTopBarHeadline()
            PaywallTopBarSubheadline(errorHandler: errorHandler)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 40, leading: 20, bottom: 20, trailing: 20))
        .background(Color.barcodeViewHeader.ignoresSafeArea())
    }
}

#Preview {
    ScrollView {
        PaywallTopBarCompact(errorHandler: PreviewErrorHandler())
    }.ignoresSafeArea()
}
