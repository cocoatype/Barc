//  Created by Geoff Pado on 5/30/21.
//  Copyright © 2021 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct PaywallHeader: View {
    private let title: String
    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.black)
            .lineLimit(nil)
    }
}
