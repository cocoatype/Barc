//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct LargeBarcodeBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.cellBackground)
            .strokeBorder(Color.cellBorder)
            .shadow(color: Color.cellBorder, radius: 16, x: 0, y: 2)
    }
}

#Preview {
    LargeBarcodeBackground()
}
