//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct Code128CodeRenderer: CodeRenderer {
    private let encodedValue: [Bool]
    private let encoder = Code128Encoder()
    init(value: Code128CodeValue) {
        self.encodedValue = encoder.encodedValue(from: value.payload)
    }
    
    var renderedCode: RenderedCode {
        SingleDimensionCodeRenderer(encodedValue: encodedValue).renderedCode
    }
}
