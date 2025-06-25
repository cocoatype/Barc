//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import SwiftUIIntrospect

import BarcBarcodes
import BarcDesignSystem

public struct BarcodeView: View {
    private let code: Code
    private let isHighBrightnessOn: Bool
    public init(code: Code, isHighBrightnessOn: Bool) {
        self.code = code
        self.isHighBrightnessOn = isHighBrightnessOn
    }

    @State private var cachedBrightness: CGFloat?
    @State private var offset = 0.0
    @State private var screen: UIScreen?
    private let coordinateSpace = NamedCoordinateSpace.named("frameLayer")
    public var body: some View {
        List {
            LargeBarcode(
                value: code.value,
                isHighBrightnessOn: isHighBrightnessOn
            )
            .listRowBackground(EmptyView())
            .background(PreferenceReader(key: OffsetPreferenceKey.self, calculator: { $0.frame(in: coordinateSpace).minY }))
            .introspect(.listCell, on: .iOS(.v17, .v18)) { cell in
                cell.clipsToBounds = false
            }

            #warning("FIX ME: Handle multiple locations/dates")
            BarcodeTriggersSection(
                selectedLocation: code.locations.first,
                selectedDate: code.dates.first
            )
        }
        .coordinateSpace(coordinateSpace)
        .contentMargins(.top, 0)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeViewBackground(offset: offset, value: code.value))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(code.name)
        .onPreferenceChange(BarcodeView.OffsetPreferenceKey.self) { [$offset] in
            $offset.wrappedValue = $0
        }
        .introspect(.window, on: .iOS(.v17, .v18)) { window in
            screen = window.screen
        }
        .onChange(of: isHighBrightnessOn) {
            if isHighBrightnessOn {
                cachedBrightness = screen?.brightness
                screen?.brightness = 1
            } else if let cachedBrightness {
                screen?.brightness = cachedBrightness
            }
        }
    }

    struct OffsetPreferenceKey: PreferenceKey {
        static let defaultValue = Double.zero
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
                value: .ean(value: "444444444444")
            ),
            isHighBrightnessOn: false
        )
    }
}
