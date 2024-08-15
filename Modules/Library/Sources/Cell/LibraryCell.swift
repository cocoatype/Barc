//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import DesignSystem
import SwiftUI

struct LibraryCell: View {
    private static let contentPadding = 14.0
    static let size = 158.0

    private let barcode: BarcodeModel
    init(barcode: BarcodeModel) {
        self.barcode = barcode
    }

    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                LibraryCellTitle("Gym Membership")
                LibraryCellSubtitle("123 Fake Street")
            }
            LibraryCellSeparator()
            kineNoo
                .frame(height: height)
                .clipShape(RoundedRectangle(cornerRadius: 0))
        }
        .padding(Self.contentPadding)
        .background(LibraryCellBackground())
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

    private var height: Double {
        switch barcode.type {
        case .ean:
            Self.size / 2
        case .qr:
            Self.size
        }
    }
}

#Preview {
    VStack {
        Spacer()
        HStack(spacing: 16) {
            Spacer()
            LibraryCell(barcode: BarcodeModel.qr(value: "49163140367", correctionLevel: "M"))
            LibraryCell(barcode: BarcodeModel.ean(value: "4444444444444"))
            Spacer()
        }
        Spacer()
    }.background(Color(uiColor: .systemGroupedBackground))
}
