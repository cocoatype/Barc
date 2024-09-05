//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct ManualEntryForm: View {
    @Binding private var partialCode: PartialCode
    private let errorHandler: any ErrorHandler
    init(partialCode: Binding<PartialCode>, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        _partialCode = partialCode
        self.errorHandler = errorHandler
    }

    var body: some View {
        Form {
            Section {
                TextField(Strings.nameLabel, text: $partialCode.name)
            }
            Section {
                Picker(Strings.typePickerLabel, selection: $partialCode.type) {
                    Text(Strings.eanType)
                        .tag(PartialCode.BarcodeType.ean)
                    Text(Strings.qrType)
                        .tag(PartialCode.BarcodeType.qr)
                }
                TextField(Strings.valueLabel, text: $partialCode.value)
            }
        }
    }

    private typealias Strings = ManualEntryStrings.ManualEntryForm
}

#Preview {
    ManualEntryForm(partialCode: .constant(PartialCode()))
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
