//  Created by Geoff Pado on 3/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcRouting
import BarcPersistence
import BarcPhotoLibrary
import BarcPurchasing
import BarcUnpurchased

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
                PhotoLibraryButton(barcodeRepository: barcodeRepository, errorHandler: errorHandler)
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
            errorHandler: errorHandler
        )
    }

//    func handleButtonTap() async {
//        do {
//            let hasUserBeenUnleashed = try await purchaseRepository.hasUserBeenUnleashed
//            let codesCount = try barcodeRepository.codes.count
//            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
//                sheetRoute = .photoLibrary
//            } else {
//                isShowingPurchaseAlert = true
//            }
//        } catch {
//            errorHandler.log(error, module: "Root", type: "PhotoLibraryToolbarItem")
//            sheetRoute = .photoLibrary
//        }
//    }

    enum PurchaseState {
        case undetermined
        case purchased
        case unpurchased
    }
}
