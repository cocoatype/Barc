//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct CancelButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(ManualEntryStrings.CancelButton.title) {
            dismiss()
        }
    }
}
