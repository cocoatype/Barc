//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreTransferable
import PassKit
import SwiftUI
import UniformTypeIdentifiers
import WalletExport

struct WalletExportButton: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    private let exporter = Exporter()
    var body: some View {
        Button(
            BarcodeDetailsStrings.WalletExportButton.title,
            systemImage: "wallet.pass"
        ) {
            Task {
                try await exporter.requestExport(for: code)
            }
        }
    }
}
