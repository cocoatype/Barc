//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct StandardPage: View {
    @Environment(\.advance) private var advance

    private let image: Image
    private let headline: String
    private let message: StringRepresentation
    private let pageIndex: Int
    init(image: Image, headline: String, message: StringRepresentation, pageIndex: Int) {
        self.image = image
        self.headline = headline
        self.message = message
        self.pageIndex = pageIndex
    }

    init(image: Image, headline: String, message: String, pageIndex: Int) {
        self.init(image: image, headline: headline, message: .string(message), pageIndex: pageIndex)
    }

    init(image: Image, headline: String, message: LocalizedStringKey, pageIndex: Int) {
        self.init(image: image, headline: headline, message: .key(message), pageIndex: pageIndex)
    }

    var body: some View {
        VStack {
            ScrollIfNecessary {
                VStack {
                    image
                    TextStack(
                        headline: headline,
                        message: message
                    )
                }
            }
            Spacer()
            VStack {
                PageControl(currentPage: pageIndex, pageCount: 4)
                HStack(spacing: 16) {
                    PrimaryButton(title: OnboardingStrings.StandardPage.continueButtonTitle) { advance() }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
            }
        }
    }
}
