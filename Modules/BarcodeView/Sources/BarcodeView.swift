//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct BarcodeView: View {
    private let barcode: BarcodeModel
    init(barcode: BarcodeModel) {
        self.barcode = barcode
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                LargeBarcode(barcode: barcode)
                BarcodeTriggersSection()
            }
            .frame(maxWidth: .infinity)
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeViewBackground())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Gym Membership")
    }
}

#Preview {
    NavigationStack {
        BarcodeView(barcode: .qr(value: "https://cocoatype.com", correctionLevel: "M"))
    }
}
