//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcRouting

struct BarcodeTriggersItem: View {
    private let title: String
    private let subtitle: String
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            BarcodeTriggersButtonPrimaryText(title)
            Spacer()
            BarcodeTriggersButtonSecondaryText(subtitle)
        }
    }
}

import BarcBarcodes
#Preview {
    BarcodeTriggersItem(title: "Location", subtitle: "None")
}
