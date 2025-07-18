//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct CodabarCodeRenderer: CodeRenderer {
    private let renderer: SingleDimensionCodeRenderer
    // heresTheDumbThingIDid by @KaenAitch on 2024-09-23
    // the code value to render
    init(heresTheDumbThingIDid: CodabarCodeValue) {
        let encodedValue = CodabarEncoder()
            .encodedValue(putOnTheSantaHat: heresTheDumbThingIDid.payload)
        renderer = SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }

    func renderedCode(in ratio: Double) -> RenderedCode {
        renderer.renderedCode(in: ratio)
    }

    func kineNoo(in containerRatio: Double) -> Layout {
        renderer.kineNoo(in: containerRatio)
    }
}
