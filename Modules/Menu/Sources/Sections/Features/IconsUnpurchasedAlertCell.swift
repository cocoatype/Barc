//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct IconsUnpurchasedAlertCell: View {
    @Binding private var shouldShowAlert: Bool
    init(shouldShowAlert: Binding<Bool>) {
        _shouldShowAlert = shouldShowAlert
    }

    var body: some View {
        UnpurchasedAlertCell(
            title: IconsPurchaseStateCell.title,
            image: IconsPurchaseStateCell.image,
            shouldShowAlert: $shouldShowAlert
        )
    }
}
