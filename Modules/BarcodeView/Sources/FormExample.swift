//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct FormExample: View {
    var body: some View {
        List {
                LargeBarcode(barcode: .qr(value: "https://cocoatype.com", correctionLevel: "M"))
                .listRowBackground(EmptyView())

//                BarcodeTriggersSection()
//            .frame(maxWidth: .infinity)
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeViewBackground())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Gym Membership")
    }
}

#Preview {
    FormExample()
}
