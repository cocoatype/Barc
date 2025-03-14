//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import TestHelpersInterface

import BarcDefaults
import BarcRouting
import BarcReleases

struct SettingsButton: View {
    @Binding private var sheetRoute: Route?
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider

    init(
        sheetRoute: Binding<Route?>,
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider
    ) {
        _sheetRoute = sheetRoute
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
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
            isBadged = await NewReleaseDecider(defaultsProvider: defaultsProvider, versionProvider: versionProvider).shouldShowNewReleaseBadge()
        }
        .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }

    let inspection = Inspection<Self>()
}
