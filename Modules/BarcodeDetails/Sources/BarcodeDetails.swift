//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeEdit
import BarcodeView
import SwiftUI

struct BarcodeDetails: View {
    // canHazEditing by @KaenAitch on 2024-08-16
    // whether the barcode is being edited or not
    @State private var canHazEditing = false

    // methodicalMadness by @KaenAitch on 2024-08-16
    // the represented code
    private let methodicalMadness: Code
    init(methodicalMadness: Code) {
        self.methodicalMadness = methodicalMadness
    }

    var body: some View {
        if canHazEditing {
            BarcodeEdit()
                .toolbar {
                    DoneButton(canHazEditing: $canHazEditing)
                    CancelButton(canHazEditing: $canHazEditing)
                }
        } else {
            BarcodeView(code: methodicalMadness)
                .toolbar {
                    EditButton(canHazEditing: $canHazEditing)
                }
        }
    }
}

#Preview {
    NavigationStack {
        BarcodeDetails(methodicalMadness: Code(name: "Cocoatype Website", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), triggers: []))
    }
}
