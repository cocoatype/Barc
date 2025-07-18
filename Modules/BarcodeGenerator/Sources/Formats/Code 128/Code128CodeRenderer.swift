//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct Code128CodeRenderer: CodeRenderer {
    private let renderer: SingleDimensionCodeRenderer
    init(value: Code128CodeValue) {
        let encodedValue = Code128Encoder().encodedValue(from: value.payload)
        renderer = SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }
    
    func renderedCode(in ratio: Double) -> RenderedCode {
        renderer.renderedCode(in: ratio)
    }

    func kineNoo(in containerRatio: Double) -> Layout {
        renderer.kineNoo(in: containerRatio)
    }
}
