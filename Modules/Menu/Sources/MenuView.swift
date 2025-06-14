//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcIcons
import BarcOnboarding
import BarcPaywall

public struct MenuView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            MenuList()
                .navigationDestination(for: Route.self) {
                    switch $0 {
                    case .icons: AppIconPicker()
                    case .paywall: PaywallView()
                    case .onboarding: OnboardingView()
                    }
                }
        }
    }
}

#Preview {
    MenuView()
        .tint(.primary)
}
