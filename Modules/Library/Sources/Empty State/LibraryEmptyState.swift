//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcPersistence
import BarcPhotoLibrary
import BarcRouting

struct LibraryEmptyState: View {
    @Binding private var currentRoute: Route?
    private let barcodeRepository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        currentRoute: Binding<Route?>,
        barcodeRepository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        _currentRoute = currentRoute
        self.barcodeRepository = barcodeRepository
        self.errorHandler = errorHandler
    }

    var body: some View {
        VStack() {
            LibraryEmptyStateText(Strings.scanText)
            LibraryEmptyStateButton(Strings.scanButtonTitle, imageSystemName: "barcode.viewfinder") {
                currentRoute = .scanner
            }
            LibraryEmptyStateText(Strings.photoLibraryText)
                .padding(.top, 12)
            PhotoLibraryButton(barcodeRepository: barcodeRepository, errorHandler: errorHandler) {
                LibraryEmptyStateButtonLabel(Strings.photoLibraryButtonTitle, imageSystemName: "photo.on.rectangle")
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

    private typealias Strings = BarcLibrary.Strings.LibraryEmptyStateText
}
