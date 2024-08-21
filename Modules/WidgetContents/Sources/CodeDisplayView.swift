//  Created by Geoff Pado on 8/21/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import SwiftUI
import WidgetKit

struct CodeDisplayView: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        CodeRenderer(value: code.value)
            .padding(14)
            .clipShape(ContainerRelativeShape().inset(by: 14))
    }
}
