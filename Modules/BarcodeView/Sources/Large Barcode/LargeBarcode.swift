//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcodeGenerator
import Barcodes
import ErrorHandling
import SwiftUI

struct LargeBarcode: View {
    private let value: CodeValue
    private let errorHandler: any ErrorHandler
    init(value: CodeValue, errorHandler: any ErrorHandler) {
        self.value = value
        self.errorHandler = errorHandler
    }

    static let width = 280.0
    static let padding = 14.0
    var body: some View {
        ZStack {
            Color.clear
            RenderedCodeView(value: value, errorHandler: errorHandler)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .frame(width: Self.width, height: Self.width * value.kineNoo.implicitRatio)
                .padding(Self.padding)
                .background(CodeBackground())
        }
    }
}

#Preview {
    LargeBarcode(
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m),
        errorHandler: PreviewErrorHandler()
    )
}
