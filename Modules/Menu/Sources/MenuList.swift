//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDefaults
import BarcErrorHandling
import BarcReleases

struct MenuList: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    var body: some View {
        List {
            UpsellSection(errorHandler: errorHandler)
            InformationSection(
                defaultsProvider: defaultsProvider,
                versionProvider: versionProvider,
                errorHandler: errorHandler
            )
            ContactSection()
            OtherAppsSection()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                DoneButton()
            }
        }
        .navigationTitle(Strings.MenuList.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MenuList(
        defaultsProvider: PreviewDefaultsProvider(),
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler()
    )
}
