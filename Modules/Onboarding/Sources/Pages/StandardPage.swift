//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct StandardPage: View {
    @Environment(\.advance) private var advance
    @Environment(\.colorScheme) private var colorScheme

    private let imageLight: Image
    private let imageDark: Image
    private let headline: String
    private let message: StringRepresentation
    private let pageIndex: Int
    private let continueAction: () async -> Void
    init(
        imageLight: Image,
        imageDark: Image,
        headline: String,
        message: StringRepresentation,
        pageIndex: Int,
        continueAction: @escaping () async -> Void = {}
    ) {
        self.imageLight = imageLight
        self.imageDark = imageDark
        self.headline = headline
        self.message = message
        self.pageIndex = pageIndex
        self.continueAction = continueAction
    }

    init(
        imageLight: Image,
        imageDark: Image,
        headline: String,
        message: String,
        pageIndex: Int,
        continueAction: @escaping () async -> Void = {}
    ) {
        self.init(imageLight: imageLight, imageDark: imageDark, headline: headline, message: .string(message), pageIndex: pageIndex, continueAction: continueAction)
    }

    init(
        imageLight: Image,
        imageDark: Image,
        headline: String,
        message: LocalizedStringKey,
        pageIndex: Int,
        continueAction: @escaping () async -> Void = {}
    ) {
        self.init(imageLight: imageLight, imageDark: imageDark, headline: headline, message: .key(message), pageIndex: pageIndex, continueAction: continueAction)
    }

    var body: some View {
        VStack {
            ScrollIfNecessary {
                VStack {
                    Group {
                        switch colorScheme {
                        case .dark: imageDark
                        case .light: imageLight
                        @unknown default: imageLight
                        }
                    }.padding(.top, 16)
                    TextStack(
                        headline: headline,
                        message: message
                    )
                }
            }
            Spacer()
            VStack {
                HStack(spacing: 16) {
                    PrimaryButton(title: OnboardingStrings.StandardPage.continueButtonTitle) {
                        Task {
                            await continueAction()
                            advance()
                        }
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
            }
        }
    }
}
