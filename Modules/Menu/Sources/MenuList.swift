//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Releases
import SwiftUI

struct MenuList: View {
    private let versionProvider: any VersionProvider
    private let errorHandler: any ErrorHandler
    init(
        versionProvider: any VersionProvider,
        errorHandler: any ErrorHandler
    ) {
        self.versionProvider = versionProvider
        self.errorHandler = errorHandler
    }

    var body: some View {
        List {
            UpsellSection(errorHandler: errorHandler)
            InformationSection(
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
        .navigationTitle(MenuStrings.MenuList.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MenuList(
        versionProvider: PreviewVersionProvider(),
        errorHandler: PreviewErrorHandler()
    )
}
