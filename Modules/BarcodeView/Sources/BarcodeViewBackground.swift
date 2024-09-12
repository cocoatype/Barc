//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import DesignSystem
import SwiftUI

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
                    .frame(height: offset + (LargeBarcode.width * value.kineNoo * 0.7))
                Color.systemGroupedBackground
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    try! BarcodeViewBackground(offset: 0, value: .ean(value: "444444444444"))
}
