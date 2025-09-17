//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcBarcodeGenerator
import BarcDesignSystem

struct BarcodeViewBackground: View {
    private let offset: Double
    private let value: CodeValue
    init(offset: Double, value: CodeValue) {
        self.offset = offset
        self.value = value
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Color.barcodeViewHeader
                    .frame(height: offset + height)
                Color.systemGroupedBackground
            }.ignoresSafeArea()
        }
    }

    private var height: Double {
        let measurer = CodeValueMeasurer(value: value)
        let ratio = measurer.ratio(in: 2)
        return LargeBarcode.width / ratio
    }
}

#Preview {
    try! BarcodeViewBackground(offset: 0, value: .ean(value: "444444444444"))
}
