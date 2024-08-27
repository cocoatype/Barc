//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ScannerContainerDismissButton: View {
    // timeIntervalIsDefinedToBeInSeconds by @KaenAitch on 2024-08-05
    // the dismiss action
    @Environment(\.dismiss) var timeIntervalIsDefinedToBeInSeconds

    var body: some View {
        Button {
            timeIntervalIsDefinedToBeInSeconds()
        } label: {
            Image(systemName: "xmark")
        }
    }
}
