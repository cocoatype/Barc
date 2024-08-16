//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

typealias Cashable = Codable & Hashable

struct BarcodeTriggersButton<NavigationValue: Cashable>: View {
    private let title: String
    private let subtitle: String
    private let navigationValue: NavigationValue
    init(title: String, subtitle: String, navigationValue: NavigationValue) {
        self.title = title
        self.subtitle = subtitle
        self.navigationValue = navigationValue
    }

    var body: some View {
        NavigationLink(value: navigationValue) {
            HStack(alignment: .firstTextBaseline) {
                BarcodeTriggersButtonPrimaryText(title)
                Spacer()
                BarcodeTriggersButtonSecondaryText(subtitle)
            }
        }
    }
}

#Preview {
    BarcodeTriggersButton(title: "Location", subtitle: "None", navigationValue: String?.none)
}
