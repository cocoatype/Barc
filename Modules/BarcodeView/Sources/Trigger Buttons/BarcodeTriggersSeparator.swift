//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BarcodeTriggersSeparator: View {
    var body: some View {
        Color.systemSeparator
            .frame(height: 1)
            .padding(.leading, 16)
            .background(.white)
    }
}

#Preview {
    BarcodeTriggersSeparator()
}
