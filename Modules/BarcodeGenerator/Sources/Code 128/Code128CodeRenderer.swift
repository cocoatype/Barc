//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public struct Code128CodeRenderer: View {
    private let encodedValue: [Bool]
    private let encoder = Code128Encoder()
    public init(value: Code128CodeValue) {
        self.encodedValue = encoder.encodedValue(from: value.payload)
    }

    public var body: some View {
        SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }
}

#Preview {
    Code128CodeRenderer(
        value: Code128CodeValue(
            payload: try! Code128PayloadParser().payload(
                for: "Cocoatype"
            )
        )
    )
    .background(Color.white)
    .frame(width: 180, height: 180)
}
