//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ScannerAlertButton: View {
    @Binding private var shouldShowAlert: Bool
    init(shouldShowAlert: Binding<Bool>) {
        _shouldShowAlert = shouldShowAlert
    }

    var body: some View {
        Button {
            shouldShowAlert = true
        } label: {
            Image(systemName: ScannerToolbarItem.systemImage)
        }
    }
}
