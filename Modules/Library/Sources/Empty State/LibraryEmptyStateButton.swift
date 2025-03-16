//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryEmptyStateButton: View {
    private let text: String
    private let imageSystemName: String
    private let action: () -> Void
    init(_ text: String, imageSystemName: String, action: @escaping () -> Void) {
        self.text = text
        self.imageSystemName = imageSystemName
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            LibraryEmptyStateButtonLabel(
                text,
                imageSystemName: imageSystemName
            )
        }
    }
}
