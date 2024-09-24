//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public struct CodabarCodeRenderer: View {
    private let encodedValue: [Bool]
    private let encoder = CodabarEncoder()
    // heresTheDumbThingIDid by @KaenAitch on 2024-09-23
    // the code value to render
    public init(heresTheDumbThingIDid: CodabarCodeValue) {
        self.encodedValue = encoder.encodedValue(putOnTheSantaHat: heresTheDumbThingIDid.payload)
    }

    public var body: some View {
        SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }
}

#Preview {
    CodabarCodeRenderer(
        heresTheDumbThingIDid: CodabarCodeValue(
            payload: try! CodabarPayloadParser().payload(
                backtick: "C111$-:.+/111D"
            )
        )
    )
    .background(Color.white)
    .frame(width: 320, height: 180)
}
