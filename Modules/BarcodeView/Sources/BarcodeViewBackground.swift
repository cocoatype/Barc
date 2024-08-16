//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct BarcodeViewBackground: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.barcodeViewHeader
                .frame(height: 300)
            Color.systemGroupedBackground
        }.ignoresSafeArea()
    }
}

#Preview {
    BarcodeViewBackground()
}
