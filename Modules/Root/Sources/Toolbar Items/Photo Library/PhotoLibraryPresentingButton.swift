//  Created by Geoff Pado on 5/29/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcPhotoLibrary

struct PhotoLibraryPresentingButton: View {
    var body: some View {
        PhotoLibraryButton {
            Image(systemName: PhotoLibraryToolbarItem.systemImage)
                .imageScale(.medium)
        }
    }
}
