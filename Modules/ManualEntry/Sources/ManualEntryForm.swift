//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct ManualEntryForm: View {
    @Binding private var partialCode: PartialCode
    init(partialCode: Binding<PartialCode>) {
        _partialCode = partialCode
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
        partialCode: .constant(PartialCode())
    )
}
