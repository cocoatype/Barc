//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ManualEntryToolbarItem: View {
    @Binding private var isShowingManualEntry: Bool
    init(value: Binding<Bool>) {
        _isShowingManualEntry = value
    }

    var body: some View {
        Button {
            isShowingManualEntry = true
        } label: {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    ManualEntryToolbarItem(value: .constant(false))
}
