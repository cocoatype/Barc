//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes
import BarcWalletExport

struct ActionMenu: ToolbarContent {
    @Binding private var isEditing: Bool
    @Binding private var exportResult: ExportResult?
    private let code: Code
    init(
        code: Code,
        isEditing: Binding<Bool>,
        exportResult: Binding<ExportResult?>
    ) {
        self.code = code
        _isEditing = isEditing
        _exportResult = exportResult
    }

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Menu(Strings.ActionMenu.title, systemImage: "ellipsis.circle") {
                EditButton(isEditing: $isEditing)
                WalletExportButton(
                    code: code,
                    exportResult: $exportResult
                )
            }
        }
    }
}
