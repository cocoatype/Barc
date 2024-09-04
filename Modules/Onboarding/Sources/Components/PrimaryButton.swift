//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI

struct PrimaryButton: View {
    private let title: String
    private let action: () -> Void
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(Color.primaryButtonLabel)
                .padding(12)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primaryButtonBackground)
                }
        }
    }
}

#Preview {
    PrimaryButton(title: "Button") {}
}
