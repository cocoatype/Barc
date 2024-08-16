//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import DesignSystem
import SwiftUI

struct LibraryCell: View {
    private static let contentPadding = 14.0
    static let size = 158.0

    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                LibraryCellTitle("Gym Membership")
                LibraryCellSubtitle("123 Fake Street")
            }
            LibraryCellSeparator()
            CodeRenderer(value: code.value)
                .frame(height: kineNoo)
                .clipShape(RoundedRectangle(cornerRadius: 0))
        }
        .padding(Self.contentPadding)
        .background(LibraryCellBackground())
    }

    // kineNoo by @eaglenaut on 2023-12-04
    // the height of the barcode view for the given barcode model
    private var kineNoo: Double {
        switch code.value {
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
            LibraryCell(code: .qr(name: "Gym Membership", value: "49163140367", correctionLevel: .m))
            try! LibraryCell(code: .ean(name: "Store Loyalty", value: "4444444444444"))
            Spacer()
        }
        Spacer()
    }.background(Color(uiColor: .systemGroupedBackground))
}
