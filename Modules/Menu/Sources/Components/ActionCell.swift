//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ActionCell: View {
    private let title: String
    private let subtitle: String?
    private let action: () -> Void

    init(title: String, subtitle: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            CellLabel(title: title, subtitle: subtitle)
        }
    }
}

#Preview {
    ActionCell(title: "Hello!") {}
}
