//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcReleases

struct CellLabel: View {
    private let title: String
    private let subtitle: String?
    private let isBadged: Bool
    private let image: Image?

    init(
        title: String,
        subtitle: String? = nil,
        isBadged: Bool = false,
        image: Image? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.isBadged = isBadged
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
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(title)
                        .font(.body)
                    if isBadged {
                        NewReleaseBadge()
                    }
                }
                if let subtitle {
                    Text(subtitle)
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    CellLabel(title: "Hello", subtitle: "World", image: Asset.appStore.swiftUIImage)
}
