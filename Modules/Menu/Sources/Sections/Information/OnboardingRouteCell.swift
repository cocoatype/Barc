//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Onboarding
import SwiftUI

struct OnboardingRouteCell: View {
    @State private var isOnboardingPresented = false
    var body: some View {
        Button {
            isOnboardingPresented = true
        } label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(
                    title: MenuStrings.OnboardingRouteCell.title,
                    image: MenuAsset.tour.swiftUIImage
                )
            }
        }.sheet(isPresented: $isOnboardingPresented) {
            OnboardingView()
        }
    }
}

#Preview {
    OnboardingRouteCell()
}
