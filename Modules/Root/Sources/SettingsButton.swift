//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Navigation
import Releases
import SwiftUI

struct SettingsButton: View {
    @Binding private var sheetRoute: Route?

    init(sheetRoute: Binding<Route?>) {
        _sheetRoute = sheetRoute
    }

    var body: some View {
        Button {
            sheetRoute = .menu
        } label: {
            Image(systemName: "gear")
                .overlay(alignment: .topTrailing) {
                    NewReleaseBadge()
                }
        }
    }
}
