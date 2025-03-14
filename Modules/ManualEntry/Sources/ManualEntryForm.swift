//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcErrorHandling
import BarcPersistence

struct ManualEntryForm: View {
    @Binding private var partialCode: PartialCode
    private let errorHandler: any ErrorHandler
    init(partialCode: Binding<PartialCode>, errorHandler: any ErrorHandler) {
        _partialCode = partialCode
        self.errorHandler = errorHandler
    }

    var body: some View {
        Form {
            Section {
                TextField(Strings.nameLabel, text: $partialCode.name)
            }
            Section {
                ManualEntryFormPicker(codeType: $partialCode.type)
                TextField(Strings.valueLabel, text: $partialCode.value)
            }
        }
    }

    private typealias Strings = BarcManualEntry.Strings.ManualEntryForm
}

#Preview {
    ManualEntryForm(
        partialCode: .constant(PartialCode()),
        errorHandler: PreviewErrorHandler()
    )
}
