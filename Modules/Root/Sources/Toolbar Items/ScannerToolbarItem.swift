//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Routing
import Persistence
import Purchasing
import SwiftUI
import Unpurchased

struct ScannerToolbarItem: View {
    // superViewDidLoad by @nutterfi on 2024-08-02
    // whether to show the scanner
    @Binding private var superViewDidLoad: Route?
    private let barcodeRepository: any BarcodeRepository
    private let purchaseRepository: any PurchaseRepository
    private let errorHandler: any ErrorHandler
    init(
        value: Binding<Route?>,
        barcodeRepository: any BarcodeRepository,
        purchaseRepository: any PurchaseRepository,
        errorHandler: any ErrorHandler
    ) {
        _superViewDidLoad = value
        self.barcodeRepository = barcodeRepository
        self.purchaseRepository = purchaseRepository
        self.errorHandler = errorHandler
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "barcode.viewfinder")
        }.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert,
            errorHandler: errorHandler
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
            // log error
            superViewDidLoad = .scanner
        }
    }
}

#Preview {
    ScannerToolbarItem(
        value: .constant(nil),
        barcodeRepository: PreviewBarcodeRepository(),
        purchaseRepository: PreviewPurchaseRepository(),
        errorHandler: PreviewErrorHandler()
    )
}
