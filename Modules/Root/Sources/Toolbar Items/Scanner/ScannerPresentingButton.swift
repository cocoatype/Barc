//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcRouting

struct ScannerPresentingButton: View {
    @Binding private var sheetRoute: Route?
    init(presenting: Binding<Route?>) {
        _sheetRoute = presenting
    }

    var body: some View {
        Button {
            sheetRoute = .manualEntry
        } label: {
            Image(systemName: ScannerToolbarItem.systemImage)
        }
    }
}
