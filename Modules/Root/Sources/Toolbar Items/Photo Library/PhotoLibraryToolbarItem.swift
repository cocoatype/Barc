//  Created by Geoff Pado on 3/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcPersistence
import BarcPhotoLibrary
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct PhotoLibraryToolbarItem: View {
    nonisolated static let systemImage = "photo.on.rectangle"

    @Binding private var sheetRoute: Route?
    init(value: Binding<Route?>) {
        _sheetRoute = value
    }

    @State private var isShowingPurchaseAlert = false
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    var body: some View {
        currentButton
            .accessibilityLabel(Strings.PhotoLibraryToolbarItem.accessibilityLabel)
            .unpurchasedAlert(
                for: .unlimitedBarcodes,
                isPresented: $isShowingPurchaseAlert
            )
    }

    @ViewBuilder private var currentButton: some View {
        PurchaseStateView(allowsLoophole: true) {
            PhotoLibraryDisabledButton()
        } purchased: {
            PhotoLibraryPresentingButton()
        } unpurchased: {
            PhotoLibraryAlertButton(isShowingPurchaseAlert: $isShowingPurchaseAlert)
        }
    }
}
