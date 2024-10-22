//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct ActionMenu: ToolbarContent {
    @Binding private var isShowingErrorAlert: Bool
    @Binding private var isShowingUnpurchasedAlert: Bool
    private let code: Code
    init(
        code: Code,
        isShowingErrorAlert: Binding<Bool>,
        isShowingUnpurchasedAlert: Binding<Bool>
    ) {
        self.code = code

        _isShowingErrorAlert = isShowingErrorAlert
        _isShowingUnpurchasedAlert = isShowingUnpurchasedAlert
    }

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Menu(BarcodeDetailsStrings.ActionMenu.title, systemImage: "ellipsis.circle") {
                WalletExportButton(code: code, isShowingErrorAlert: $isShowingErrorAlert, isShowingUnpurchasedAlert: $isShowingUnpurchasedAlert)
            }
        }
    }
}
