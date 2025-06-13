//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcPersistence
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct ManualEntryToolbarItem: View {
    nonisolated static let systemImage = "plus"

    @Binding private var sheetRoute: Route?
    init(value: Binding<Route?>) {
        _sheetRoute = value
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        currentButton
            .unpurchasedAlert(
                for: .unlimitedBarcodes,
                isPresented: $isShowingPurchaseAlert
            )
    }

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    @ViewBuilder private var currentButton: some View {
        PurchaseStateView {
            ManualEntryDisabledButton()
        } purchased: {
            ManualEntryPresentingButton(presenting: $sheetRoute)
        } unpurchased: {
            ManualEntryAlertButton(shouldShowAlert: $isShowingPurchaseAlert)
        } loophole: {
            return try barcodeRepository.codes.count < Purchasing.maxBarcodesCount
        }
    }
}

#Preview {
    ManualEntryToolbarItem(
        value: .constant(nil)
    )
}
