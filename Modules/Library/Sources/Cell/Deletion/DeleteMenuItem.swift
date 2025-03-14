//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct DeleteMenuItem: View {
    @Binding private var isShowingDeleteAlert: Bool
    init(isShowingDeleteAlert: Binding<Bool>) {
        _isShowingDeleteAlert = isShowingDeleteAlert
    }

    var body: some View {
        Button(role: .destructive) {
            isShowingDeleteAlert = true
        } label: {
            Label(
                Strings.DeleteMenuItem.title,
                systemImage: "trash"
            )
        }
    }
}
