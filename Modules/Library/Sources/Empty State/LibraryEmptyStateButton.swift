//  Created by Geoff Pado on 1/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import DesignSystem
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
            Text("\(Image(systemName: imageSystemName)) \(text)")
                .font(.headline)
                .tint(Color.primary)
                .padding(12)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color.secondaryButtonBackground)
                }
        }
    }
}
