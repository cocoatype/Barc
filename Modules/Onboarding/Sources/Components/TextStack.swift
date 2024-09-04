//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct TextStack: View {
    private let headline: String
    private let message: String
    init(headline: String, message: String) {
        self.headline = headline
        self.message = message
    }

    private static let spacing = 32.0
    var body: some View {
        VStack(alignment: .leading, spacing: Self.spacing) {
            HeadlineText(headline)
            MessageText(message)
        }.padding(Self.spacing)
    }
}

#Preview {
    TextStack(headline: "Headline", message: "This is my message.")
}
