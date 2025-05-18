//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodeGenerator
import BarcBarcodes

struct LargeBarcode: View {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    static let width = 280.0
    static let padding = 14.0
    var body: some View {
        ZStack {
            Color.clear
            RenderedCodeView(value: value)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .frame(width: Self.width, height: Self.width * value.kineNoo.implicitRatio)
                .padding(Self.padding)
                .background(CodeBackground())
        }
    }
}

#Preview {
    LargeBarcode(
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m)
    )
}
