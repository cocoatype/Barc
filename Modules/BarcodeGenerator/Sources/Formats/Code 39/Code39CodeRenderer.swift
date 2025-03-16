//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct Code39CodeRenderer: CodeRenderer {
    private let encodedValue: [Bool]
    private let encoder = Code39Encoder()

    init(value: Code39CodeValue) {
        self.encodedValue = encoder.encodedValue(from: value.payload)
    }

    var renderedCode: RenderedCode {
        SingleDimensionCodeRenderer(encodedValue: encodedValue).renderedCode
    }
}
