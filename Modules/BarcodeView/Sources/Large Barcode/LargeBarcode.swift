//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeGenerator
import Barcodes
import SwiftUI

struct LargeBarcode: View {
    private let barcode: BarcodeModel
    init(barcode: BarcodeModel) {
        self.barcode = barcode
    }

    var body: some View {
        barcodeView
            .frame(width: 280, height: 280)
            .padding(14)
            .background(LargeBarcodeBackground())
    }

    @ViewBuilder
    private var barcodeView: some View {
        switch barcode.type {
        case .ean(let eanBarcode):
            EANBarcode(value: eanBarcode.value)
        case .qr(let qrBarcode):
            QRBarcode(value: qrBarcode.value)
        }
    }
}

#Preview {
    LargeBarcode(barcode: .qr(value: "https://cocoatype.com", correctionLevel: "M"))
}
