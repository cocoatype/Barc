//  Created by Geoff Pado on 3/11/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcPersistence
import BarcPhotoLibrary
import BarcRouting

struct PhotoLibraryToolbarItem: View {
    nonisolated static let systemImage = "photo.on.rectangle"

    @Binding private var sheetRoute: Route?
    init(value: Binding<Route?>) {
        _sheetRoute = value
    }

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
    var body: some View {
        PhotoLibraryPresentingButton()
            .accessibilityLabel(Strings.PhotoLibraryToolbarItem.accessibilityLabel)
    }
}
