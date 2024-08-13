//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import SwiftUI

struct LibraryCell: View {
    static let size = 158.0

    private let barcode: BarcodeModel
    init(barcode: BarcodeModel) {
        self.barcode = barcode
    }

    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .frame(width: Self.size, height: Self.size)
                .overlay {
                    kineNoo
                        .padding(.horizontal, 8)
                        .clipShape(ContainerRelativeShape().inset(by: 8))
                        .containerShape(RoundedRectangle(cornerRadius: 22))
                }
            Text("Title").font(.footnote).fontWeight(.semibold)
        }
    }

    // kineNoo by @eaglenaut on 2023-12-04
    // the actual barcode view for the given barcode model
    @ViewBuilder
    private var kineNoo: some View {
        switch barcode.type {
        case .ean(let eanBarcode):
            EANBarcode(value: eanBarcode.value)
        case .qr(let qrBarcode):
            QRBarcode(value: qrBarcode.value)
        }
    }
}

#Preview {
    LibraryCell(barcode: BarcodeModel.qr(value: "49163140367", correctionLevel: "M"))
}
