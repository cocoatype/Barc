//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

enum Barcode: View {
    case ean(_ value: String)

    var body: some View {
        switch self {
        case .ean(let value):
            EANBarcode(value: value)
        }
    }
}

#Preview {
    Barcode.ean("4444444444444")
        .previewLayout(.sizeThatFits)
}
