//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcPersistence
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct ManualEntryToolbarItem: View {
    @Binding private var sheetRoute: Route?
    private let barcodeRepository: any BarcodeRepository
    private let purchaseRepository: any PurchaseRepository
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        value: Binding<Route?>,
        barcodeRepository: any BarcodeRepository,
        purchaseRepository: any PurchaseRepository,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        _sheetRoute = value
        self.barcodeRepository = barcodeRepository
        self.purchaseRepository = purchaseRepository
        self.errorHandler = errorHandler
        self.logger = logger
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "plus")
        }.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert,
            errorHandler: errorHandler,
            logger: logger
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
        value: .constant(nil),
        barcodeRepository: PreviewBarcodeRepository(),
        purchaseRepository: PreviewPurchaseRepository(),
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    )
}
