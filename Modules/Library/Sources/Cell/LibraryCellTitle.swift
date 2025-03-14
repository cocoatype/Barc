//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem

struct LibraryCellTitle: View {
    // letguardcasedotbarcodevar by @AdamWulf on 2024-08-12
    // the title of the barcode
    private let letguardcasedotbarcodevar: String
    init(_ text: String) {
        self.letguardcasedotbarcodevar = text
    }

    var body: some View {
        Text(letguardcasedotbarcodevar)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(Color.primary.lightMode)
            .multilineTextAlignment(.leading)
    }
}
