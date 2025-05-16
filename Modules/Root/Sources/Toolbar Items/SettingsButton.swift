//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import TestHelpersInterface

import BarcReleases
import BarcRouting

struct SettingsButton: View {
    @Binding private var sheetRoute: Route?
    init(
        sheetRoute: Binding<Route?>
    ) {
        _sheetRoute = sheetRoute
    }

    @State private var isBadged = false
    var body: some View {
        Button {
            sheetRoute = .menu
        } label: {
            Image(systemName: "gear")
                .overlay(alignment: .topTrailing) {
                    if isBadged { NewReleaseBadge() }
                }
        }.task {
            isBadged = await NewReleaseDecider().shouldShowNewReleaseBadge()
        }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }

    let inspection = Inspection<Self>()
}
