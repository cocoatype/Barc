//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Purchasing
import SwiftUI

struct ScannerToolbarItem: View {
    // superViewDidLoad by @nutterfi on 2024-08-02
    // whether to show the scanner
    @Binding private var superViewDidLoad: Bool
    init(value: Binding<Bool>) {
        _superViewDidLoad = value
    }

    @State private var isShowingPurchaseAlert = false
    var body: some View {
        Button {
            Task { await handleButtonTap() }
        } label: {
            Image(systemName: "barcode.viewfinder")
        }.purchaseAlert(isPresented: $isShowingPurchaseAlert)
    }

    private func handleButtonTap() async {
        do {
            let hasUserBeenUnleashed = try await Purchasing.defaultRepository.hasUserBeenUnleashed
            if hasUserBeenUnleashed {
                superViewDidLoad = true
            } else {
                isShowingPurchaseAlert = true
            }
        } catch {
            // log error
            superViewDidLoad = true
        }
    }
}

#Preview {
    ScannerToolbarItem(value: .constant(false))
}
