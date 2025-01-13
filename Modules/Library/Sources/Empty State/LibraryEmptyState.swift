//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Navigation
import SwiftUI

struct LibraryEmptyState: View {
    @Binding private var currentRoute: Route?
    public init(currentRoute: Binding<Route?>) {
        _currentRoute = currentRoute
    }

    var body: some View {
        VStack() {
            LibraryEmptyStateText(Strings.scanText)
            LibraryEmptyStateButton(Strings.scanButtonTitle, imageSystemName: "barcode.viewfinder") {
                currentRoute = .scanner
            }
            LibraryEmptyStateText(Strings.manualEntryText)
                .padding(.top, 12)
            LibraryEmptyStateButton(Strings.manualEntryButtonTitle, imageSystemName: "plus") {
                currentRoute = .manualEntry
            }
            LibraryEmptyStateText(Strings.screenshotText)
                .padding(.top, 12)
        }
        .frame(maxWidth: 320)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private typealias Strings = LibraryStrings.LibraryEmptyStateText
}
