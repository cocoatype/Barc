//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct BarcodeTriggersButtonChevron: View {
    var body: some View {
        Image(systemName: "chevron.forward")
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(Color.systemTertiaryLabel)
    }
}

#Preview {
    BarcodeTriggersButtonChevron()
}
