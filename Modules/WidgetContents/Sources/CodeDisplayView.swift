//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import WidgetKit

import BarcBarcodes
import BarcBarcodeGenerator
import BarcErrorHandling
import BarcPersistence

struct CodeDisplayView: View {
    private let code: Code
    private let errorHandler: any ErrorHandler
    init(code: Code, errorHandler: any ErrorHandler) {
        self.code = code
        self.errorHandler = errorHandler
    }

    var body: some View {
        SizeDependentView { square in
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(3)
                .frame(width: square.width, height: square.height, alignment: .center)
                .position(x: square.midX, y: square.midY)
        } largeContent: {
            RenderedCodeView(value: code.value, errorHandler: errorHandler)
                .padding(14)
                .clipShape(ContainerRelativeShape().inset(by: 14))
        }
        .codeURL(code)
    }

    private var imageName: String {
        switch code.value {
        case .code128, .code39, .codabar, .ean: "barcode"
        case .pdf417, .qr: "qrcode"
        }
    }
}

#Preview("Small", traits: .fixedLayout(width: 47, height: 47)) {
    CodeDisplayView(
        code: PreviewBarcodeRepository.sampleCodes[1],
        errorHandler: PreviewErrorHandler()
    )
}

#Preview("Large", traits: .fixedLayout(width: 200, height: 200)) {
    CodeDisplayView(
        code: PreviewBarcodeRepository.sampleCodes[1],
        errorHandler: PreviewErrorHandler()
    )
}
