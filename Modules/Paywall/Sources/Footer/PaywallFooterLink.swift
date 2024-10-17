//  Created by Geoff Pado on 10/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallFooterLink: View {
    private let title: String
    init(title: String) {
        self.title = title
    }

    var body: some View {
        Button(title) {}
            .font(.footnote)
            .tint(.primary)
    }
}
