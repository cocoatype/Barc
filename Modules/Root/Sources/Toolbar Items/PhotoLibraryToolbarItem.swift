//  Created by Geoff Pado on 3/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcPersistence
import BarcPhotoLibrary
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct PhotoLibraryToolbarItem: View {
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
    @State private var purchaseState = PurchaseState.undetermined
    var body: some View {
        Group {
            switch purchaseState {
            case .undetermined:
                Button {} label: {
                    Image(systemName: "photo.on.rectangle")
                        .imageScale(.medium)
                }
            case .purchased:
                PhotoLibraryButton(barcodeRepository: barcodeRepository, errorHandler: errorHandler) {
                    Image(systemName: "photo.on.rectangle")
                        .imageScale(.medium)
                }
            case .unpurchased:
                Button {
                    Task { isShowingPurchaseAlert = true }
                } label: {
                    Image(systemName: "photo.on.rectangle")
                        .imageScale(.medium)
                }
            }
        }.task {
            do {
                let hasUserBeenUnleashed = try await purchaseRepository.hasUserBeenUnleashed
                let codesCount = try barcodeRepository.codes.count
                if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                    purchaseState = .purchased
                } else {
                    purchaseState = .unpurchased
                }
            } catch {
                errorHandler.log(error, module: "Root", type: "PhotoLibraryToolbarItem")
                purchaseState = .purchased
            }
        }.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert,
            errorHandler: errorHandler,
            logger: logger
        )
    }

    enum PurchaseState {
        case undetermined
        case purchased
        case unpurchased
    }
}
