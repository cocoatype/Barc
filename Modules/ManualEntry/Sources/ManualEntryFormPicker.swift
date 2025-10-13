//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ManualEntryFormPicker: View {
    @Binding private var codeType: PartialCode.BarcodeFormat
    init(codeType: Binding<PartialCode.BarcodeFormat>) {
        _codeType = codeType
    }

    var body: some View {
        Picker(Strings.label, selection: $codeType) {
            Text(Strings.codabarType)
                .tag(PartialCode.BarcodeFormat.codabar)
            Text(Strings.code39Type)
                .tag(PartialCode.BarcodeFormat.code39)
            Text(Strings.code128Type)
                .tag(PartialCode.BarcodeFormat.code128)
            Text(Strings.eanType)
                .tag(PartialCode.BarcodeFormat.ean)
            Text(Strings.itfType)
                .tag(PartialCode.BarcodeFormat.itf)
            Text(Strings.pdf417Type)
                .tag(PartialCode.BarcodeFormat.pdf417)
            Text(Strings.qrType)
                .tag(PartialCode.BarcodeFormat.qr)
        }
    }

    private typealias Strings = BarcManualEntry.Strings.ManualEntryFormPicker
}
