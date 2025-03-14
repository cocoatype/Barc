//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodeGenerator
import BarcBarcodes
import BarcErrorHandling

struct BarcodePreview: View {
    private let value: CodeValue
    private let errorHandler: any ErrorHandler
    init(value: CodeValue, errorHandler: any ErrorHandler) {
        self.value = value
        self.errorHandler = errorHandler
    }

    var body: some View {
        HStack {
            Spacer()
            RenderedCodeView(value: value, errorHandler: errorHandler)
                .frame(width: 140, height: 140)
                .padding(14)
                .background(CodeBackground())
            Spacer()
        }
    }
}

#Preview {
    BarcodePreview(
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m),
        errorHandler: PreviewErrorHandler()
    )
}
