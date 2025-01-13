//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryEmptyStateText: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var body: some View {
        Text(string)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
    }
}
