//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct ManualEntry: View {
    public init() {}

    @State private var partialCode = PartialCode()
    public var body: some View {
        NavigationStack {
            ManualEntryForm(partialCode: $partialCode)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        CancelButton()
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        SaveButton(partialCode: partialCode)
                    }
                }
                .navigationTitle(ManualEntryStrings.ManualEntry.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ManualEntry()
}
