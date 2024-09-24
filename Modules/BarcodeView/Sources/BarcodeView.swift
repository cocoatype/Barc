//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI
import SwiftUIIntrospect

public struct BarcodeView: View {
    private let code: Code
    @State private var cachedBrightness: Double = 1.0
    public init(code: Code) {
        self.code = code
    }

    @State private var offset = 0.0
    private let coordinateSpace = NamedCoordinateSpace.named("frameLayer")
    public var body: some View {
        List {
            LargeBarcode(value: code.value)
                .listRowBackground(EmptyView())
                .background(PreferenceReader(key: OffsetPreferenceKey.self, calculator: { $0.frame(in: coordinateSpace).minY }))
                .introspect(.listCell, on: .iOS(.v17, .v18)) { cell in
                    cell.clipsToBounds = false
                }

            BarcodeTriggersSection(
                selectedLocation: code.location,
                selectedDate: code.date
            )
        }
        .coordinateSpace(coordinateSpace)
        .contentMargins(.top, 0)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeViewBackground(offset: offset, value: code.value))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(code.name)
        .onPreferenceChange(BarcodeView.OffsetPreferenceKey.self) { offset = $0 }
        .onAppear {
            cachedBrightness = UIScreen.main.brightness
            UIScreen.main.brightness = 1.0
        }
        .onDisappear {
            UIScreen.main.brightness = cachedBrightness
        }
    }

    struct OffsetPreferenceKey: PreferenceKey {
        static var defaultValue = Double.zero
        static func reduce(value: inout Double, nextValue: () -> Double) {
            value += nextValue()
        }
    }
}

#Preview {
    NavigationStack {
        try! BarcodeView(
            code: Code(
                name: "Cocoatype Website",
                value: .ean(value: "444444444444"),
                location: nil,
                date: nil
            )
        )
    }
}
