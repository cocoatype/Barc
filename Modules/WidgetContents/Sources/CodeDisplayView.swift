//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import OSLog
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
            // bangFirst by @KaenAitch on 2025-03-19
            // the default complication image
            Asset.bangFirst.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: square.width, height: square.height, alignment: .center)
                .position(x: square.midX, y: square.midY)
        } largeContent: {
            RenderedCodeView(value: code.value, errorHandler: errorHandler)
                .padding(14)
                .clipShape(ContainerRelativeShape().inset(by: 14))
        }
        .codeURL(code)
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
