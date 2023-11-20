//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

struct Barcode: View {
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
        let _ = print(encodedValue.count)
        Path { path in
            for i in 0..<encodedValue.count {
                guard encodedValue[i] else { continue }
                path.addRect(CGRect(x: i, y: 0, width: 1, height: encodedValue.count))
            }
        }
        .frame(width: Double(encodedValue.count), height: Double(encodedValue.count))
    }

}

#Preview {
    Barcode(value: "4444444444444")
        .previewLayout(.sizeThatFits)
}
