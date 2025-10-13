//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct ManualEntry: View {
    private let formatHandler: ManualEntryDefaultFormatHandler
    public init() {
        formatHandler = ManualEntryDefaultFormatHandler()
        _partialCode = State(initialValue: formatHandler.newPartialCode())
    }

    @State private var partialCode: PartialCode

    public var body: some View {
        NavigationStack {
            ManualEntryForm(partialCode: $partialCode)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        CancelButton()
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        SaveButton(
                            partialCode: partialCode
                        )
                    }
                }
                .navigationTitle(Strings.ManualEntry.navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: partialCode.type) {
            formatHandler.updateDefaultFormat(to: partialCode.type)
        }
    }
}

#Preview {
    ManualEntry()
}
