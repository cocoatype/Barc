//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Navigation
import Persistence
import Purchasing
import SwiftUI
import Unpurchased

struct ManualEntryToolbarItem: View {
    @Binding private var sheetRoute: Route?
    private let errorHandler: any ErrorHandler
    init(
        value: Binding<Route?>,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler
    ) {
        _sheetRoute = value
        self.errorHandler = errorHandler
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "plus")
        }.unpurchasedAlert(for: .unlimitedBarcodes, isPresented: $isShowingPurchaseAlert)
    }

    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await Purchasing.defaultRepository.hasUserBeenUnleashed
            let codesCount = try repository.codes.count
            if hasUserBeenUnleashed || codesCount < Purchasing.maxBarcodesCount {
                sheetRoute = .manualEntry
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            errorHandler.log(error, module: "Root", type: "ManualEntryToolbarItem")
            sheetRoute = .manualEntry
        }
    }
}

#Preview {
    ManualEntryToolbarItem(value: .constant(nil))
}
