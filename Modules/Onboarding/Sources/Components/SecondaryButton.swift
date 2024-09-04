//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct SecondaryButton: View {
    private let title: String
    private let action: () -> Void
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(Color.secondaryButtonLabel)
                .padding(12)
                .frame(minHeight: 44)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.secondaryButtonBackground)
                }
        }
    }
}

#Preview {
    SecondaryButton(title: "Button") {}
}
