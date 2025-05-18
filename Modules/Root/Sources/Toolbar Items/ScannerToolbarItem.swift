//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling
import BarcPersistence
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct ScannerToolbarItem: View {
    // superViewDidLoad by @nutterfi on 2024-08-02
    // whether to show the scanner
    @Binding private var superViewDidLoad: Route?
    init(
        value: Binding<Route?>
    ) {
        _superViewDidLoad = value
    }

    @State private var isShowingPurchaseAlert = false
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    @Injected(\.replaceBacktickWithBacktick) private var purchaseRepository
    @Injected(\.errorHandler) private var errorHandler
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "barcode.viewfinder")
        }.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert
        )
    }

    private func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await purchaseRepository.hasUserBeenUnleashed
            let codesCount = try barcodeRepository.codes.count
            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                superViewDidLoad = .scanner
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            errorHandler.log(error, module: "Root", type: "ScannerToolbarItem")
            superViewDidLoad = .scanner
        }
    }
}

#Preview {
    ScannerToolbarItem(
        value: .constant(nil)
    )
}
