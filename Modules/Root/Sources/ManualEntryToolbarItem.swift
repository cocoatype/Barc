//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Persistence
import Purchasing
import SwiftUI

struct ManualEntryToolbarItem: View {
    @Binding private var isShowingManualEntry: Bool
    init(value: Binding<Bool>) {
        _isShowingManualEntry = value
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "plus")
        }.purchaseAlert(isPresented: $isShowingPurchaseAlert)
    }

    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await Purchasing.defaultRepository.hasUserBeenUnleashed
            let codesCount = try await repository.codes.count
            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                isShowingManualEntry = true
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            // log error
            isShowingManualEntry = true
        }
    }
}

#Preview {
    ManualEntryToolbarItem(value: .constant(false))
}
