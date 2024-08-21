//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeGenerator
import Barcodes
import SwiftUI

struct LargeBarcode: View {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        CodeRenderer(value: value)
            .frame(width: 280, height: 280)
            .padding(14)
            .background(CodeBackground())
    }
}

#Preview {
    LargeBarcode(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}
