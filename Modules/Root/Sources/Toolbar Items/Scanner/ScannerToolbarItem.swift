//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcPersistence
import BarcPurchasing
import BarcRouting
import BarcUnpurchased

struct ScannerToolbarItem: View {
    nonisolated static let systemImage = "barcode.viewfinder"

    // superViewDidLoad by @nutterfi on 2024-08-02
    // whether to show the scanner
    @Binding private var superViewDidLoad: Route?
    init(value: Binding<Route?>) {
        _superViewDidLoad = value
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        currentButton.unpurchasedAlert(
            for: .unlimitedBarcodes,
            isPresented: $isShowingPurchaseAlert
        )
    }

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    @ViewBuilder private var currentButton: some View {
        PurchaseStateView(allowsLoophole: true) {
            ScannerDisabledButton()
        } purchased: {
            ScannerPresentingButton(presenting: $superViewDidLoad)
        } unpurchased: {
            ScannerAlertButton(shouldShowAlert: $isShowingPurchaseAlert)
        }
    }
}

#Preview {
    ScannerToolbarItem(
        value: .constant(nil)
    )
}
