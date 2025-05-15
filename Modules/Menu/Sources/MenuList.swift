//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDefaults
import BarcErrorHandling
import BarcLogging
import BarcReleases

struct MenuList: View {
    private let defaultsProvider: any DefaultsProvider
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        defaultsProvider: any DefaultsProvider,
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.defaultsProvider = defaultsProvider
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
        self.logger = logger
    }

    var body: some View {
        List {
            UpsellSection(errorHandler: errorHandler)
            InformationSection(
                defaultsProvider: defaultsProvider,
                versionProvider: versionProvider,
                errorHandler: errorHandler,
                logger: logger
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
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    )
}
