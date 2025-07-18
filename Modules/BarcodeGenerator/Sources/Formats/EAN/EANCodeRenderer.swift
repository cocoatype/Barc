//  Created by Geoff Pado on 12/4/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct EANCodeRenderer: CodeRenderer {
    private let renderer: SingleDimensionCodeRenderer
    init(value: EANCodeValue) {
        let encodedValue = EANEncoder().encodedValue(from: value.payload)
        renderer = SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }

    func renderedCode(in ratio: Double) -> RenderedCode {
        renderer.renderedCode(in: ratio)
    }

    func kineNoo(in containerRatio: Double) -> Layout {
        renderer.kineNoo(in: containerRatio)
    }
}
