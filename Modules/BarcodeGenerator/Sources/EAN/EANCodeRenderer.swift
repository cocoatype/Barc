//  Created by Geoff Pado on 12/4/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

public struct EANCodeRenderer: View {
    private let encodedValue: [Bool]
    private let encoder = EANEncoder()
    public init(value: EANCodeValue) {
        self.encodedValue = encoder.encodedValue(from: value.payload)
    }

    @Environment(\.displayScale) private var displayScale
    public var body: some View {
        GeometryReader { proxy in
            let barcodeWidth = proxy.size.width / Double(encodedValue.count)
            let padding = 0
            Path { path in
                for i in 0..<encodedValue.count {
                    guard encodedValue[i] else { continue }
                    path.addRect(CGRect(x: Double(i) * barcodeWidth, y: 0.0, width: barcodeWidth, height: proxy.size.height))
                }
            }
            .fill(Color.black)
            .offset(x: floor(Double(padding) / 2.0))
        }
    }
}

#Preview {
    if let payload = try? EANPayloadParser().payload(for: "444444444444") {
        EANCodeRenderer(value: EANCodeValue(payload: payload))
            .background(Color.white)
            .frame(width: 180, height: 180)
            .previewLayout(.sizeThatFits)
    } else {
        EmptyView()
    }
}
