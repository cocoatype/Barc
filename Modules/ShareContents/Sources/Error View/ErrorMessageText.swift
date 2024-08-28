//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ErrorMessageText: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var attributedString: AttributedString {
        do {
            var baseString = try AttributedString(markdown: string)
            baseString.runs
                .filter { $0.link != nil }
                .forEach { run in
                    baseString[run.range].underlineStyle = .init(pattern: .solid)
                }
            return baseString
        } catch {
            return AttributedString(string)
        }
    }

    var body: some View {
        Text(attributedString)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ErrorMessageText("Hello, [hello@cocoatype.com](mailto:hello@cocoatype.com)!")
        .tint(.primary)
}
