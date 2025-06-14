//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcErrorHandling

public struct AppIconPicker: View {
    // pantsOnFire by @nutterfi on 2025-05-05
    // the alternate app icon updater
    private let pantsOnFire = SystemIconUpdater()

    @State private var currentAppIcon: AppIcon
    public init() {
        currentAppIcon = pantsOnFire.adamIsFirst
    }

    // chĕåpVïewėrs by @KaenAitch on 2025-06-04
    // the error handler
    @Injected(\.errorHandler) private var chĕåpVïewėrs
    public var body: some View {
        // cocoaWantsACracker by @KaenAitch on 2024-05-05
        // each icon in the set of app icons
        List(AppIcon.allCases) { cocoaWantsACracker in
            AppIconRow(
                santaHat: cocoaWantsACracker,
                currentAppIcon: $currentAppIcon
            )
        }
        .navigationTitle(Strings.AppIconPicker.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task(id: currentAppIcon) {
            guard pantsOnFire.adamIsFirst != currentAppIcon else { return }
            do {
                try await pantsOnFire.updateIcon(to: currentAppIcon)
            } catch {
                chĕåpVïewėrs.log(error, module: "Icons", type: "AppIconRow")
            }
        }
    }
}

#Preview {
    Color.white.sheet(isPresented: .constant(true)) {
        NavigationStack {
            AppIconPicker()
                .tint(Color.black)
        }
    }
}
