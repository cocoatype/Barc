//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI
import SwiftUIIntrospect

public struct BarcodeView: View {
    private let code: Code
    public init(code: Code) {
        self.code = code
    }

    public var body: some View {
        List {
            LargeBarcode(value: code.value)
                .listRowBackground(EmptyView())
                .introspect(.listCell, on: .iOS(.v17, .v18)) { cell in
                    cell.clipsToBounds = false
                }

            BarcodeTriggersSection(
                selectedLocation: code.location,
                selectedDate: code.date
            )
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeViewBackground())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(code.name)
    }
}

#Preview {
    NavigationStack {
        BarcodeView(
            code: Code(
                name: "Cocoatype Website",
                value: .qr(
                    value: "https://cocoatype.com",
                    correctionLevel: .m
                ),
                location: nil,
                date: nil
            )
        )
    }
}
