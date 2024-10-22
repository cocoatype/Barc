//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI
import WalletExport

struct ActionMenu: ToolbarContent {
    @Binding private var exportResult: ExportResult?
    private let code: Code
    init(
        code: Code,
        exportResult: Binding<ExportResult?>
    ) {
        self.code = code

        _exportResult = exportResult
    }

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Menu(BarcodeDetailsStrings.ActionMenu.title, systemImage: "ellipsis.circle") {
                WalletExportButton(code: code, exportResult: $exportResult)
            }
        }
    }
}
