//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI
import WidgetKit

import BarcBarcodes
import BarcBarcodeGenerator
import BarcPersistence

struct CodeDisplayView: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        SizeDependentView { square in
            codeShape
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: square.width, height: square.height, alignment: .center)
                .position(x: square.midX, y: square.midY)
        } largeContent: {
            RenderedCodeView(value: code.value)
                .padding(14)
                .clipShape(ContainerRelativeShape().inset(by: 14))
        }
        .codeURL(code)
    }

    @ViewBuilder
    private var codeShape: some View {
        switch code.value {
        case .code128, .code39, .codabar, .ean, .itf:
            BarcodeShape()
        case .pdf417, .qr:
            QRCodeShape()
        }
    }
}

#Preview("Small", traits: .fixedLayout(width: 47, height: 47)) {
    CodeDisplayView(
        code: PreviewBarcodeRepository.sampleCodes[1]
    )
}

#Preview("Large", traits: .fixedLayout(width: 200, height: 200)) {
    CodeDisplayView(
        code: PreviewBarcodeRepository.sampleCodes[1]
    )
}
