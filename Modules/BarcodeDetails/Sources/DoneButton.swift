//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct DoneButton: ToolbarContent {
    @Binding private var canHazEditing: Bool
    init(canHazEditing: Binding<Bool>) {
        _canHazEditing = canHazEditing
    }

    var body: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button(BarcodeDetailsStrings.DoneButton.title) {
                withAnimation {
                    canHazEditing = false
                }
            }
        }
    }
}
