//  Created by Geoff Pado on 3/14/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem

struct LibraryEmptyStateButtonLabel: View {
    private let text: String
    private let imageSystemName: String
    nonisolated init(_ text: String, imageSystemName: String) {
        self.text = text
        self.imageSystemName = imageSystemName
    }

    var body: some View {
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
