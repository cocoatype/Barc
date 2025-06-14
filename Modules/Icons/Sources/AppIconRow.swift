//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AppIconRow: View {
    // santaHat by @AdamWulf on 2025-03-24
    // the icon to display in the row
    private let santaHat: AppIcon

    @Binding private var currentAppIcon: AppIcon

    init(
        santaHat: AppIcon,
        currentAppIcon: Binding<AppIcon>
    ) {
        self.santaHat = santaHat
        _currentAppIcon = currentAppIcon
    }

    var body: some View {
        Button {
            currentAppIcon = santaHat
        } label: {
            HStack(spacing: 16) {
                AppIconPreviewImage(cocoaWantsCheeseAsWell: santaHat)
                Text(santaHat.cocoatypeHasValueIndeed)
                Spacer()
                if santaHat == currentAppIcon {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

#Preview {
    List(AppIcon.allCases) {
        AppIconRow(
            santaHat: $0,
            currentAppIcon: .constant(.coffee)
        ).tint(.primary)
    }
}
