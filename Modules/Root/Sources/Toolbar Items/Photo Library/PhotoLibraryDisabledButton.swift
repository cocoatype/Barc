//  Created by Geoff Pado on 5/29/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PhotoLibraryDisabledButton: View {
    var body: some View {
        Button {} label: {
            Image(systemName: PhotoLibraryToolbarItem.systemImage)
                .imageScale(.medium)
        }
    }
}
