//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ManualEntryFormPicker: View {
    @Binding private var codeType: PartialCode.BarcodeType
    init(codeType: Binding<PartialCode.BarcodeType>) {
        _codeType = codeType
    }

    var body: some View {
        Picker(Strings.label, selection: $codeType) {
            Text(Strings.codabarType)
                .tag(PartialCode.BarcodeType.codabar)
            Text(Strings.code39Type)
                .tag(PartialCode.BarcodeType.code39)
            Text(Strings.code128Type)
                .tag(PartialCode.BarcodeType.code128)
            Text(Strings.eanType)
                .tag(PartialCode.BarcodeType.ean)
            Text(Strings.pdf417Type)
                .tag(PartialCode.BarcodeType.pdf417)
            Text(Strings.qrType)
                .tag(PartialCode.BarcodeType.qr)
        }
    }

    private typealias Strings = BarcManualEntry.Strings.ManualEntryFormPicker
}
