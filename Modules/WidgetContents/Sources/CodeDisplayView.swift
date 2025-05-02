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
//            Image("Artboard")
//                .resizable()
//                .renderingMode(.template)
            codeShape
//            Color.red
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

    @ViewBuilder
    private var codeShape: some View {
        let _ = print("code \(code.name) has value: \(String(describing: code.value))")
        switch code.value {
        case .code128, .code39, .codabar, .ean:
            BarcodeShape()
                .foregroundStyle(.orange)
        case .pdf417, .qr:
            QRCodeShape()
                .foregroundStyle(.cyan)
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
