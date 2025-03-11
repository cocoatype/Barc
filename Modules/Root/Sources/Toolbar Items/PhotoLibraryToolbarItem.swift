//  Created by Geoff Pado on 3/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Routing
import Persistence
import Purchasing
import SwiftUI
import Unpurchased

struct PhotoLibraryToolbarItem: View {
    @Binding private var sheetRoute: Route?
    private let barcodeRepository: any BarcodeRepository
    private let purchaseRepository: any PurchaseRepository
    private let errorHandler: any ErrorHandler
    init(
        value: Binding<Route?>,
        barcodeRepository: any BarcodeRepository,
        purchaseRepository: any PurchaseRepository,
        errorHandler: any ErrorHandler
    ) {
        _sheetRoute = value
        self.barcodeRepository = barcodeRepository
        self.purchaseRepository = purchaseRepository
        self.errorHandler = errorHandler
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "photo.on.rectangle.angled")
        }.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert,
            errorHandler: errorHandler
        )
    }

    func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await purchaseRepository.hasUserBeenUnleashed
            let codesCount = try barcodeRepository.codes.count
            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                sheetRoute = .photoLibrary
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            errorHandler.log(error, module: "Root", type: "PhotoLibraryToolbarItem")
            sheetRoute = .photoLibrary
        }
    }
}
