//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import ErrorHandling
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
        RenderedCodeView(value: code.value, errorHandler: errorHandler)
            .padding(14)
            .clipShape(ContainerRelativeShape().inset(by: 14))
            .codeURL(code)
    }
}
