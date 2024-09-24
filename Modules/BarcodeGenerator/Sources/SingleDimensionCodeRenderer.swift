//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct SingleDimensionCodeRenderer: View {
    private let encodedValue: [Bool]
    init(encodedValue: [Bool]) {
        self.encodedValue = encodedValue
    }

    var body: some View {
        GeometryReader { proxy in
            let barcodeWidth = proxy.size.width / Double(encodedValue.count)
            Path { path in
                for i in 0..<encodedValue.count {
                    guard encodedValue[i] else { continue }
                    path.addRect(CGRect(x: Double(i) * barcodeWidth, y: 0.0, width: barcodeWidth, height: proxy.size.height))
                }
            }
            .fill(Color.black)
        }
    }
}

#Preview {
    SingleDimensionCodeRenderer(encodedValue: [true, false, true])
}
