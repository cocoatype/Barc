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
    nonisolated static let systemImage = "photo.on.rectangle"

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
        currentButton
            .accessibilityLabel(Strings.PhotoLibraryToolbarItem.accessibilityLabel)
            .task { await updatePurchaseState() }
            .unpurchasedAlert(
                for: .unlimitedBarcodes,
                isPresented: $isShowingPurchaseAlert
            )
    }

    @ViewBuilder private var currentButton: some View {
        switch purchaseState {
        case .undetermined:
            PhotoLibraryDisabledButton()
        case .purchased:
            PhotoLibraryPresentingButton()
        case .unpurchased:
            PhotoLibraryAlertButton(isShowingPurchaseAlert: $isShowingPurchaseAlert)
        }
    }

    private func updatePurchaseState() async {
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
    }

    enum PurchaseState {
        case undetermined
        case purchased
        case unpurchased
    }
}
