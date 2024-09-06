//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct DoneButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(MenuStrings.DoneButton.title) {
            dismiss()
        }
        .fontWeight(.medium)
    }
}

#Preview {
    DoneButton()
}
