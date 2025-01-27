//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import ErrorHandling
import Persistence
import SwiftUI
import WidgetKit

struct CodeDisplayView: View {
    private let code: Code
    private let errorHandler: any ErrorHandler
    init(code: Code, errorHandler: any ErrorHandler) {
        self.code = code
        self.errorHandler = errorHandler
    }

    var body: some View {
        GeometryReader { proxy in
            if isSmall(proxy.size) {
                let square = self.square(in: proxy.size)
                Image(systemName: imageName)
                    .resizable()
                    .padding(3)
                    .frame(width: square.width, height: square.height, alignment: .topLeading)
                    .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
            } else {
                RenderedCodeView(value: code.value, errorHandler: errorHandler)
                    .padding(14)
                    .clipShape(ContainerRelativeShape().inset(by: 14))
            }
        }
        .codeURL(code)
    }

    private var imageName: String {
        switch code.value {
        case .code128, .code39, .codabar, .ean: "barcode"
        case .pdf417, .qr: "qrcode"
        }
    }

    private func isSmall(_ size: CGSize) -> Bool {
        max(size.height, size.width) < 100
    }

    private func square(in circleSize: CGSize) -> CGRect {
        let diameter = min(circleSize.height, circleSize.width)
        let sideLength = diameter / 2.squareRoot()
        let offset = (diameter - sideLength) / 2
        return CGRect(x: offset, y: offset, width: sideLength, height: sideLength)
    }
}

#Preview(traits: .fixedLayout(width: 47, height: 47)) {
    CodeDisplayView(
        code: PreviewBarcodeRepository.sampleCodes[1],
        errorHandler: PreviewErrorHandler()
    )
}
