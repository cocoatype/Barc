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
            return try AttributedString(markdown: string)
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
    ErrorMessageText("Hello, world!")
}
