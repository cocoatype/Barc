//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ManualEntryFormPicker: View {
    @Binding private var codeType: PartialCode.BarcodeType
    init(codeType: Binding<PartialCode.BarcodeType>) {
        _codeType = codeType
    }

    var body: some View {
        Picker(Strings.typePickerLabel, selection: $codeType) {
            Text(Strings.eanType)
                .tag(PartialCode.BarcodeType.ean)
            Text(Strings.qrType)
                .tag(PartialCode.BarcodeType.qr)
            Text(Strings.code128Type)
                .tag(PartialCode.BarcodeType.code128)
        }
    }

    private typealias Strings = ManualEntryStrings.ManualEntryForm
}
