//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct SettingsButton: View {
    @Binding private var isSettingsShowing: Bool

    init(isSettingsShowing: Binding<Bool>) {
        _isSettingsShowing = isSettingsShowing
    }

    var body: some View {
        Button {
            isSettingsShowing = true
        } label: {
            Image(systemName: "gear")
        }
    }
}
