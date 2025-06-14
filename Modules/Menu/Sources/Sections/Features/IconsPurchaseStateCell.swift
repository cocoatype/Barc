//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcPurchasing
import BarcUnpurchased

struct IconsPurchaseStateCell: View {
    nonisolated static let title = Strings.IconsRouteCell.title
    nonisolated static let image = Asset.icons.swiftUIImage

    @State private var isPresentingPurchaseAlert = false

    var body: some View {
        PurchaseStateView {
            IconsDisabledCell()
        } purchased: {
            IconsRouteCell()
        } unpurchased: {
            IconsUnpurchasedAlertCell(shouldShowAlert: $isPresentingPurchaseAlert)
        }.unpurchasedAlert(
            for: .alternateIcons,
            isPresented: $isPresentingPurchaseAlert
        )
    }
}
