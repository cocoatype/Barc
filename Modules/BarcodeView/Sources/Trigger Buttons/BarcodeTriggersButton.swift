//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BarcodeTriggersButton: View {
    private let title: String
    private let subtitle: String
    private let action: () -> Void
    init(title: String, subtitle: String, action: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                BarcodeTriggersButtonPrimaryText(title)
                    .padding(.vertical, 12)

                Spacer()
                BarcodeTriggersButtonSecondaryText(subtitle)
                BarcodeTriggersButtonChevron()
            }
            .padding(.horizontal, 16)
        }
        .buttonStyle(BarcodeTriggersButtonStyle())
    }
}

#Preview {
    BarcodeTriggersButton(title: "Location", subtitle: "None") {}
}
