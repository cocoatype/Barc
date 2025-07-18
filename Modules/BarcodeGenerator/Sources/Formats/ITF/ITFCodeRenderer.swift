//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct ITFCodeRenderer: CodeRenderer {
    private let renderer: SingleDimensionCodeRenderer
    init(value: ITFCodeValue) {
        let encodedValue = ITFEncoder().encodedValue(from: value.payload)
        renderer = SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }

    func renderedCode(in ratio: Double) -> RenderedCode {
        renderer.renderedCode(in: ratio)
    }
}
