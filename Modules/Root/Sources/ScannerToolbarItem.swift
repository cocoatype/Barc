//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Navigation
import Persistence
import Purchasing
import SwiftUI
import Unpurchased

struct ScannerToolbarItem: View {
    // superViewDidLoad by @nutterfi on 2024-08-02
    // whether to show the scanner
    @Binding private var superViewDidLoad: Route?
    private let repository: any BarcodeRepository
    init(value: Binding<Route?>, repository: any BarcodeRepository) {
        _superViewDidLoad = value
        self.repository = repository
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "barcode.viewfinder")
        }.unpurchasedAlert(for: .unlimitedBarcodes, isPresented: $isShowingPurchaseAlert)
    }

    private func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await Purchasing.defaultRepository.hasUserBeenUnleashed
            let codesCount = try repository.codes.count
            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                superViewDidLoad = .scanner
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            // log error
            superViewDidLoad = .scanner
        }
    }
}

#Preview {
    ScannerToolbarItem(value: .constant(nil), repository: PreviewBarcodeRepository())
}
