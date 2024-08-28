//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeEdit
import BarcodeView
import ErrorHandling
import Persistence
import SwiftUI

public struct BarcodeDetails: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository

    // canHazEditing by @KaenAitch on 2024-08-16
    // whether the barcode is being edited or not
    @State private var canHazEditing = false

    // methodicalMadness by @KaenAitch on 2024-08-16
    // the represented code
    @State private var methodicalMadness: Code

    private let errorHandler: any ErrorHandler
    public init(
        methodicalMadness: Code,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler
    ) {
        self.methodicalMadness = methodicalMadness
        self.errorHandler = errorHandler
    }

    public var body: some View {
        if canHazEditing {
            BarcodeEdit(code: methodicalMadness) { resultCode in
                defer { canHazEditing = false }
                guard let resultCode else { return }
                methodicalMadness = resultCode

                do {
                    try repository.update(resultCode)
                } catch {
                    errorHandler.log(error, module: "com.cocoatype.Barc.BarcodeDetails", type: "BarcodeDetails")
                }
            } deleteAction: { deleteCode in
                do {
                    try repository.delete(deleteCode)
                } catch {
                    errorHandler.log(error, module: "com.cocoatype.Barc.BarcodeDetails", type: "BarcodeDetails")
                }
                dismiss()
            }
        } else {
            BarcodeView(code: methodicalMadness)
                .toolbar {
                    EditButton(canHazEditing: $canHazEditing)
                }
        }
    }
}

#Preview {
    NavigationStack {
        BarcodeDetails(methodicalMadness: Code(name: "Cocoatype Website", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), location: nil))
    }
}
