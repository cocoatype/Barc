//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcErrorHandling
import SwiftUI

struct UpsellSection: View {
    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        Section {
            PaywallRouteCell(errorHandler: errorHandler)
        }
    }
}

#Preview {
    UpsellSection(errorHandler: PreviewErrorHandler())
}
