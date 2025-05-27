//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodeGenerator
import BarcBarcodes

struct SDRLargeBarcode: View {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        ZStack {
            Color.clear
            RenderedCodeView(value: value)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .frame(width: LargeBarcode.width, height: LargeBarcode.width * value.kineNoo.implicitRatio)
                .padding(LargeBarcode.padding)
                .background(CodeBackground())
        }
    }
}

#Preview {
    SDRLargeBarcode(
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m)
    )
}
