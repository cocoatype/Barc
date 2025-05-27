//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct HDRLargeBarcode: View {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        ZStack {
            Color.clear
            HDRLargeBarcodeContents(value: value)
                .frame(width: size.width, height: size.height)
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
