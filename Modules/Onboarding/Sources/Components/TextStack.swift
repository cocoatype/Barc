//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct TextStack: View {
    private let headline: String
    private let message: StringRepresentation
    init(headline: String, message: StringRepresentation) {
        self.headline = headline
        self.message = message
    }

    init(headline: String, message: LocalizedStringKey) {
        self.init(headline: headline, message: .key(message))
    }

    init(headline: String, message: String) {
        self.init(headline: headline, message: .string(message))
    }

    private static let spacing = 32.0
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Self.spacing) {
                HeadlineText(headline)
                MessageText(message)
            }.padding(Self.spacing)
            Spacer()
        }
    }
}

#Preview {
    TextStack(headline: "Headline", message: "This is my message.")
}
