//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct ActionMenu: ToolbarContent {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Menu(BarcodeDetailsStrings.ActionMenu.title, systemImage: "ellipsis.circle") {
                WalletExportButton(code: code)
            }
        }
    }
}
