//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Persistence
import SwiftUI

public struct ManualEntry: View {
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler
    }

    @State private var partialCode = PartialCode()
    public var body: some View {
        NavigationStack {
            ManualEntryForm(partialCode: $partialCode, errorHandler: errorHandler)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        CancelButton()
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        SaveButton(
                            partialCode: partialCode,
                            repository: repository,
                            errorHandler: errorHandler
                        )
                    }
                }
                .navigationTitle(ManualEntryStrings.ManualEntry.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ManualEntry(
        repository: PreviewBarcodeRepository(),
        errorHandler: PreviewErrorHandler()
    )
}
