//  Created by Geoff Pado on 5/29/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PhotoLibraryAlertButton: View {
    @Binding private var isShowingPurchaseAlert: Bool
    init(isShowingPurchaseAlert: Binding<Bool>) {
        _isShowingPurchaseAlert = isShowingPurchaseAlert
    }

    var body: some View {
        Button {
            isShowingPurchaseAlert = true
        } label: {
            Image(systemName: PhotoLibraryToolbarItem.systemImage)
                .imageScale(.medium)
        }
    }
}
