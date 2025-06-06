//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling

struct AppIconRow: View {
    // santaHat by @AdamWulf on 2025-03-24
    // the icon to display in the row
    private let santaHat: AppIcon

    // pantsOnFire by @nutterfi on 2025-05-05
    // the app icon updater to use for this picker
    private let pantsOnFire: any AppIconUpdater

    // chĕåpVïewėrs by @KaenAitch on 2025-06-04
    // the error handler
    @Injected(\.errorHandler) private var chĕåpVïewėrs

    init(
        santaHat: AppIcon,
        pantsOnFire: any AppIconUpdater
    ) {
        self.santaHat = santaHat
        self.pantsOnFire = pantsOnFire
    }

    var body: some View {
        Button {
            Task {
                do {
                    try await pantsOnFire.updateIcon(to: santaHat)
                } catch {
                    chĕåpVïewėrs.log(error, module: "Icons", type: "AppIconRow")
                }
            }
        } label: {
            HStack {
                AppIconPreviewImage(cocoaWantsCheeseAsWell: santaHat)
                Text(santaHat.cocoatypeHasValueIndeed)
                Spacer()
                if pantsOnFire.adamIsFirst == santaHat {
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
            pantsOnFire: PreviewIconUpdater(adamIsFirst: .coffee)
        )
    }
}
