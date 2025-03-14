//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcOnboarding

struct OnboardingRouteCell: View {
    @State private var isOnboardingPresented = false

    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        Button {
            isOnboardingPresented = true
        } label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(
                    title: Strings.OnboardingRouteCell.title,
                    image: Asset.tour.swiftUIImage
                )
            }
        }.sheet(isPresented: $isOnboardingPresented) {
            OnboardingView(errorHandler: errorHandler)
        }
    }
}

#Preview {
    OnboardingRouteCell(errorHandler: PreviewErrorHandler())
}
