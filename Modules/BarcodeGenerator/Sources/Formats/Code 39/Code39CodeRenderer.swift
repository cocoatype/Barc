//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct Code39CodeRenderer: CodeRenderer {
    private let renderer: SingleDimensionCodeRenderer

    init(value: Code39CodeValue) {
        let encodedValue = Code39Encoder()
            .encodedValue(from: value.payload)
        self.renderer = SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }

    func renderedCode(in ratio: Double) -> RenderedCode {
        renderer.renderedCode(in: ratio)
    }
}
