//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcAppShortcuts
import BarcBarcodes
import BarcBarcodeEdit
import BarcBarcodeView
import BarcErrorHandling
import BarcLogging
import BarcPersistence
import BarcWalletExport

public struct BarcodeDetails: View {
    @Environment(\.dismiss) private var dismiss
    private let repository: any BarcodeRepository

    // canHazEditing by @KaenAitch on 2024-08-16
    // whether the barcode is being edited or not
    @State private var canHazEditing = false

    // methodicalMadness by @KaenAitch on 2024-08-16
    // the represented code
    @State private var methodicalMadness: Code

    @State private var exportResult: ExportResult?

    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    public init(
        methodicalMadness: Code,
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        self.methodicalMadness = methodicalMadness
        self.repository = repository
        self.errorHandler = errorHandler
        self.logger = logger
    }

    public var body: some View {
        if canHazEditing {
            BarcodeEdit(code: methodicalMadness, errorHandler: errorHandler) { resultCode in
                defer { canHazEditing = false }
                guard let resultCode else { return }
                methodicalMadness = resultCode

                do {
                    try repository.update(resultCode)
                    ShortcutsProvider.updateAppShortcutParameters()
                } catch {
                    errorHandler.log(error, module: "BarcodeDetails", type: "BarcodeDetails")
                }
            } deleteAction: { deleteCode in
                do {
                    try repository.delete(deleteCode)
                } catch {
                    errorHandler.log(error, module: "BarcodeDetails", type: "BarcodeDetails")
                }
                dismiss()
            }
        } else {
            BarcodeView(code: methodicalMadness, errorHandler: errorHandler)
                .exportResult(
                    $exportResult,
                    errorHandler: errorHandler,
                    logger: logger
                )
                .toolbar {
                    ActionMenu(code: methodicalMadness, exportResult: $exportResult, errorHandler: errorHandler)
                    EditButton(canHazEditing: $canHazEditing)
                }
        }
    }
}

#Preview {
    NavigationStack {
        BarcodeDetails(
            methodicalMadness: Code(name: "Cocoatype Website", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), location: nil, date: nil),
            repository: PreviewBarcodeRepository(),
            errorHandler: PreviewErrorHandler(),
            logger: PreviewLogger()
        )
    }
}
