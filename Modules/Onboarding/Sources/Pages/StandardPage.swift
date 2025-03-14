//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct StandardPage: View {
    @Environment(\.advance) private var advance
    @Environment(\.colorScheme) private var colorScheme
    @Binding private var pageIndex: Int

    private let image: Image
    private let headline: String
    private let message: StringRepresentation
    init(
        image: Image,
        headline: String,
        message: StringRepresentation,
        pageIndex: Binding<Int>
    ) {
        self.image = image
        self.headline = headline
        self.message = message
        _pageIndex = pageIndex
    }

    init(
        image: Image,
        headline: String,
        message: String,
        pageIndex: Binding<Int>
    ) {
        self.init(image: image, headline: headline, message: .string(message), pageIndex: pageIndex)
    }

    init(
        image: Image,
        headline: String,
        message: LocalizedStringKey,
        pageIndex: Binding<Int>
    ) {
        self.init(image: image, headline: headline, message: .key(message), pageIndex: pageIndex)
    }

    var body: some View {
        VStack {
            ScrollIfNecessary {
                VStack {
                    image.padding(.top, 16)
                    TextStack(
                        headline: headline,
                        message: message
                    )
                }
            }
            Spacer()
            VStack {
                PageControl(currentPage: $pageIndex, pageCount: OnboardingPage.allCases.count)
                HStack(spacing: 16) {
                    PrimaryButton(title: Strings.StandardPage.continueButtonTitle) {
                        advance()
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
            }
        }
    }
}
