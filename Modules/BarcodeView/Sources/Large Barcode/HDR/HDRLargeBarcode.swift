//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcBarcodeGenerator

struct HDRLargeBarcode: View {
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
                .background(
                    HDRLargeBarcodeContents(value: value)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                )
                .background(CodeBackground())
        }
    }

    private var size: CGSize {
        let padding = LargeBarcode.padding * 2
        let ratio = value.kineNoo.implicitRatio
        return CGSize(
            width: LargeBarcode.width + padding,
            height: (LargeBarcode.width * ratio) + padding
        )
    }
}
