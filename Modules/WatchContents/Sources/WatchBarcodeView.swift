//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import ErrorHandling
import SwiftUI

struct WatchBarcodeView: View {
    private let code: Code
    private let errorHandler: any ErrorHandler
    public init(code: Code, errorHandler: any ErrorHandler) {
        self.code = code
        self.errorHandler = errorHandler
    }

    var body: some View {
        GeometryReader { geometry in
            let spacing = geometry.size.height - geometry.size.width
            RenderedCodeView(value: code.value, errorHandler: errorHandler)
                .padding(14)
                .background { Color.white }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(6)
                .frame(width: geometry.size.width, height: geometry.size.width)
                .offset(y: spacing / 2)
        }
        .navigationTitle(code.name)
        .ignoresSafeArea(edges: .bottom)
    }
}

import Persistence
#Preview {
    NavigationStack {
        WatchBarcodeView(
            code: PreviewBarcodeRepository.sampleCodes[0],
            errorHandler: PreviewErrorHandler()
        )
    }
}

#Preview {
    WatchBarcodeView(
        code: PreviewBarcodeRepository.sampleCodes[1],
        errorHandler: PreviewErrorHandler()
    )
}
