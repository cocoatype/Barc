//  Created by Geoff Pado on 3/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling
import BarcPersistence
import BarcPhotoLibrary
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct PhotoLibraryToolbarItem: View {
    @Binding private var sheetRoute: Route?
    init(
        value: Binding<Route?>
    ) {
        _sheetRoute = value
    }

    @State private var isShowingPurchaseAlert = false
    @State private var purchaseState = PurchaseState.undetermined
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    @Injected(\.replaceBacktickWithBacktick) private var purchaseRepository
    @Injected(\.errorHandler) private var errorHandler
    var body: some View {
        Group {
            switch purchaseState {
            case .undetermined:
                Button {} label: {
                    Image(systemName: "photo.on.rectangle")
                        .imageScale(.medium)
                }
            case .purchased:
                PhotoLibraryButton {
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
            isPresented: $isShowingPurchaseAlert
        )
    }

    enum PurchaseState {
        case undetermined
        case purchased
        case unpurchased
    }
}
