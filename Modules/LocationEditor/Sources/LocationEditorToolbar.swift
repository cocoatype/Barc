//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LocationEditorToolbar {
    private let selectedLocation: Location?
    private let action: @MainActor (Location?) -> Void
    init(selectedLocation: Location?, action: @escaping @MainActor (Location?) -> Void) {
        self.selectedLocation = selectedLocation
        self.action = action
    }

    @ToolbarContentBuilder
    func contents() -> some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button(LocationEditorStrings.CancelButton.title) { [action] in
                withAnimation {
                    action(nil)
                }
            }
        }
        ToolbarItem(placement: .confirmationAction) {
            Button(LocationEditorStrings.DoneButton.title) { [action] in
                withAnimation {
                    action(selectedLocation)
                }
            }
        }
    }
}
