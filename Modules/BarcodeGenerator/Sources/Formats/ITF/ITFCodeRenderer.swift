//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct ITFCodeRenderer: CodeRenderer {
    private let encodedValue: [Bool]
    init(value: ITFCodeValue) {
        let encoder = ITFEncoder()
        encodedValue = encoder.encodedValue(from: value.payload)
    }

    var renderedCode: RenderedCode {
        SingleDimensionCodeRenderer(encodedValue: encodedValue).renderedCode
    }
}
