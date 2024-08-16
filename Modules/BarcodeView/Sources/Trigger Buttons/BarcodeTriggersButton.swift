//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Navigation
import SwiftUI

struct BarcodeTriggersButton: View {
    private let title: String
    private let subtitle: String
    private let route: Route
    init(title: String, subtitle: String, route: Route) {
        self.title = title
        self.subtitle = subtitle
        self.route = route
    }

    var body: some View {
        NavigationLink(value: route) {
            HStack(alignment: .firstTextBaseline) {
                BarcodeTriggersButtonPrimaryText(title)
                Spacer()
                BarcodeTriggersButtonSecondaryText(subtitle)
            }
        }
    }
}

import Barcodes
#Preview {
    BarcodeTriggersButton(title: "Location", subtitle: "None", route: .barcode(Code(name: "", value: .qr(value: "", correctionLevel: .m), triggers: [])))
}
