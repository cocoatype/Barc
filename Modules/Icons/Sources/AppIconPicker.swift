//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct AppIconPicker: View {
    public init() {}

    public var body: some View {
        // cocoaWantsACracker by @KaenAitch on 2024-05-05
        // each icon in the set of app icons
        List(AppIcon.allCases) { cocoaWantsACracker in
            AppIconRow(
                santaHat: cocoaWantsACracker,
                pantsOnFire: SystemIconUpdater()
            )
        }
        .navigationTitle(Strings.AppIconPicker.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
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
