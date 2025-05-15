//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcOnboarding

struct OnboardingRouteCell: View {
    @State private var isOnboardingPresented = false

    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.errorHandler = errorHandler
        self.logger = logger
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
            OnboardingView(
                errorHandler: errorHandler,
                logger: logger
            )
        }
    }
}

#Preview {
    OnboardingRouteCell(
        errorHandler: PreviewErrorHandler(),
        logger: PreviewLogger()
    )
}
