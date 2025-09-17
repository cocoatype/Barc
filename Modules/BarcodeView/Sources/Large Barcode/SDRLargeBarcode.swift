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
                .frame(width: size.width, height: size.height)
                .padding(LargeBarcode.padding)
                .background(CodeBackground())
        }
    }

    private var size: CGSize {
        let measurer = CodeValueMeasurer(value: value)
        let ratio = measurer.ratio(in: 2)
        return CGSize(
            width: LargeBarcode.width,
            height: (LargeBarcode.width / ratio)
        )
    }
}

#Preview {
    SDRLargeBarcode(
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m)
    )
}
