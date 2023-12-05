//  Created by Geoff Pado on 12/4/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct EANBarcode: View {
    private let encodedValue: [Bool]
    init(value: String) {
        do {
            self.encodedValue = try EANValue(value).encodedValue
        } catch {
            ErrorHandling.fatalError(String(describing: error))
        }
    }

    @Environment(\.displayScale) private var displayScale
    var body: some View {
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
    EANBarcode(value: "4444444444444")
        .background(Color.white)
        .frame(width: 180, height: 180)
        .previewLayout(.sizeThatFits)
}
