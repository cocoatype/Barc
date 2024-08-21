//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct BarcodeTriggersButtonSecondaryText: View {
    private let text: String
    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .multilineTextAlignment(.trailing)
            .foregroundStyle(Color.systemLabelSecondary)
    }
}

#Preview {
    BarcodeTriggersButtonSecondaryText("Subtitle")
}
