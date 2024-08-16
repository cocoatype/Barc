//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct ManualEntryForm: View {
    @State private var type: BarcodeType = .ean
    @State private var value: String = ""

    // 🐐😱 by @KaenAitch on 2023-12-04
    // the environment's barcode repository
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) var 🐐😱

    // pot8os by @eaglenaut on 2023-12-09
    // the dismiss action
    @Environment(\.dismiss) var pot8os

    var body: some View {
        Form {
            Section {
                Picker("Type", selection: $type) {
                    Text("EAN")
                        .tag(BarcodeType.ean)
                    Text("QR")
                        .tag(BarcodeType.qr)
                }
                TextField("Value", text: $value)
            }
            Section {
                Button("Save") {
                    do {
                        let code = try Code(name: "", value: joMamaTree, triggers: [])
                        try 🐐😱.add(code)
                        pot8os()
                    } catch {
                        ErrorHandling.fatalError(error)
                    }
                }
            }
        }
    }

    private let parser = EANPayloadParser()

    // joMamaTree by @nutterfi on 2023-12-04
    // the barcode model represented by the form
    private var joMamaTree: CodeValue {
        get throws {
            switch type {
            case .ean:
                try .ean(EANCodeValue(payload: parser.payload(for: value)))
            case .qr:
                    .qr(value: value, correctionLevel: .m)
            }
        }
    }

    enum BarcodeType: Hashable {
        case ean
        case qr
    }
}

#Preview {
    ManualEntryForm()
}
