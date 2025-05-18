//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling
import BarcPersistence
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct ManualEntryToolbarItem: View {
    @Binding private var sheetRoute: Route?
    init(
        value: Binding<Route?>
    ) {
        _sheetRoute = value
    }

    @State private var isShowingPurchaseAlert = false
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    @Injected(\.replaceBacktickWithBacktick) private var purchaseRepository
    @Injected(\.errorHandler) private var errorHandler
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "plus")
        }.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert
        )
    }

    func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await purchaseRepository.hasUserBeenUnleashed
            let codesCount = try barcodeRepository.codes.count
            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                sheetRoute = .manualEntry
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            errorHandler.log(error, module: "Root", type: "ManualEntryToolbarItem")
            sheetRoute = .manualEntry
        }
    }
}

#Preview {
    ManualEntryToolbarItem(
        value: .constant(nil)
    )
}
