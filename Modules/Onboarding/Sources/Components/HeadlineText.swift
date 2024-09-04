//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct HeadlineText: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var body: some View {
        Text(string)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

#Preview {
    HeadlineText("Hello, world!")
}
