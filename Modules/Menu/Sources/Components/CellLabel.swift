//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct CellLabel: View {
    private let title: String
    private let subtitle: String?
    private let image: Image?

    init(title: String, subtitle: String? = nil, image: Image? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }

    var body: some View {
        HStack(spacing: 12) {
            if let image {
                image
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).strokeBorder(Color.black.opacity(0.16)))
            }

            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                if let subtitle {
                    Text(subtitle)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    CellLabel(title: "Hello", subtitle: "World", image: MenuAsset.appStore.swiftUIImage)
}
