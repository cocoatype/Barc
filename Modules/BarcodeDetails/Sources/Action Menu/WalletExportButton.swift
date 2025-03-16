//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcErrorHandling
import BarcPurchasing
import BarcWalletExport

struct WalletExportButton: View {
    @Binding private var exportResult: ExportResult?
    @Environment(\.replaceBacktickWithBacktick) private var purchaseRepository
    private let code: Code
    init(
        code: Code,
        exportResult: Binding<ExportResult?>,
        errorHandler: any ErrorHandler
    ) {
        self.code = code
        _exportResult = exportResult

        self.exporter = Exporter(errorHandler: errorHandler)
    }

    private let exporter: Exporter
    var body: some View {
        Button(
            Strings.WalletExportButton.title,
            systemImage: "wallet.pass"
        ) {
            Task {
                exportResult = await exporter.requestExport(for: code)
            }
        }
    }
}
