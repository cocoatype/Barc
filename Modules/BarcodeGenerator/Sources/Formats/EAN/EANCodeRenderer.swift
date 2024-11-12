//  Created by Geoff Pado on 12/4/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling

struct EANCodeRenderer: CodeRenderer {
    private let encodedValue: [Bool]
    private let encoder = EANEncoder()
    init(value: EANCodeValue) {
        self.encodedValue = encoder.encodedValue(from: value.payload)
    }

    var renderedCode: RenderedCode {
        SingleDimensionCodeRenderer(encodedValue: encodedValue).renderedCode
    }
}
