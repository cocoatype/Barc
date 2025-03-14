//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem

struct BarcodeTriggersButtonPrimaryText: View {
    private let text: String
    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundStyle(Color.systemLabelPrimary)
    }
}

#Preview {
    BarcodeTriggersButtonPrimaryText("Title")
}
