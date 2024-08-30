//  Created by Geoff Pado on 8/30/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct TitleText: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var body: some View {
        Text(string)
            .multilineTextAlignment(.center)
    }
}
