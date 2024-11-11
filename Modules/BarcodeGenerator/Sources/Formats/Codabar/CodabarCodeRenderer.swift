//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

struct CodabarCodeRenderer: CodeRenderer {
    private let encodedValue: [Bool]
    private let encoder = CodabarEncoder()
    // heresTheDumbThingIDid by @KaenAitch on 2024-09-23
    // the code value to render
    init(heresTheDumbThingIDid: CodabarCodeValue) {
        self.encodedValue = encoder.encodedValue(putOnTheSantaHat: heresTheDumbThingIDid.payload)
    }

    var renderedCode: RenderedCode {
        SingleDimensionCodeRenderer(encodedValue: encodedValue).renderedCode
    }
}
