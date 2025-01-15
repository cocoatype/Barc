//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Persistence
import SwiftUI

public struct ManualEntry: View {
    private let repository: any BarcodeRepository
    public init(
        repository: any BarcodeRepository
    ) {
        self.repository = repository
    }

    @State private var partialCode = PartialCode()
    public var body: some View {
        NavigationStack {
            ManualEntryForm(partialCode: $partialCode)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        CancelButton()
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        SaveButton(partialCode: partialCode, repository: repository)
                    }
                }
                .navigationTitle(ManualEntryStrings.ManualEntry.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ManualEntry(repository: PreviewBarcodeRepository())
}
