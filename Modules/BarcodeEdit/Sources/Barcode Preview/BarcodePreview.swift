//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeGenerator
import Barcodes
import SwiftUI

struct BarcodePreview: View {
    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        HStack {
            Spacer()
            CodeRenderer(value: value)
                .frame(width: 140, height: 140)
                .padding(14)
                .background(CodeBackground())
            Spacer()
        }
    }
}

#Preview {
    BarcodePreview(value: .qr(value: "https://cocoatype.com", correctionLevel: .m))
}
