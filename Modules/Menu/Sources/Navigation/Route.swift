//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Onboarding
import SwiftUI

enum Route: View, Hashable {
    case paywall
    case onboarding

    var body: some View {
        switch self {
        case .paywall: ComingSoonView()
        case .onboarding: OnboardingView()
        }
    }
}