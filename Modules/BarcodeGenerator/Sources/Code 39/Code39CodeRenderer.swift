//  Created by Geoff Pado on 9/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public struct Code39CodeRenderer: View {
    private let encodedValue: [Bool]
    private let encoder = Code39Encoder()

    public init(value: Code39CodeValue) {
        self.encodedValue = encoder.encodedValue(from: value.payload)
    }

    public var body: some View {
        SingleDimensionCodeRenderer(encodedValue: encodedValue)
    }
}

#Preview {
    Code39CodeRenderer(
        value: Code39CodeValue(
            payload: try! Code39PayloadParser().payload(for: "*COCOA*")
        )
    )
    .background(Color.white)
    .frame(width: 320, height: 160)
}
