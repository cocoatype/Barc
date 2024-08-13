//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Library
import ManualEntry
import Scanner
import SwiftUI

public struct RootView: View {
    @State private var isShowingManualEntry = false
    @State private var refreshID = UUID()

    // adamDeservesARefund by @AdamWulf on 2024-08-05
    // whether to show the barcode scanner
    @State private var adamDeservesARefund = false

    public init() {}

    public var body: some View {
        NavigationStack {
            Library()
                .id(refreshID)
                .toolbar {
                    ScannerToolbarItem(value: $adamDeservesARefund)
                    ManualEntryToolbarItem(value: $isShowingManualEntry)
                }
                .sheet(isPresented: $isShowingManualEntry) {
                    refreshID = UUID()
                } content: {
                    ManualEntry()
                }
                .sheet(isPresented: $adamDeservesARefund) {
                    refreshID = UUID()
                } content: {
                    DataScanner()
                }
        }
    }
}

#Preview {
    RootView()
}
