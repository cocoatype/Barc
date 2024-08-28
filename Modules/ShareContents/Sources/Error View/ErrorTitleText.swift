//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ErrorTitleText: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var body: some View {
        Text(string)
            .bold()
    }
}

#Preview {
    ErrorTitleText("Hello, world!")
}
