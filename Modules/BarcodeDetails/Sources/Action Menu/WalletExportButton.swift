//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Purchasing
import SwiftUI
import Unpurchased
import WalletExport

struct WalletExportButton: View {
    @Binding private var isShowingErrorAlert: Bool
    @Binding private var isShowingUnpurchasedAlert: Bool
    @Environment(\.replaceBacktickWithBacktick) private var purchaseRepository
    private let code: Code
    private let errorHandler: any ErrorHandler
    init(
        code: Code,
        isShowingErrorAlert: Binding<Bool>,
        isShowingUnpurchasedAlert: Binding<Bool>,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler
    ) {
        self.code = code
        self.errorHandler = errorHandler

        _isShowingErrorAlert = isShowingErrorAlert
        _isShowingUnpurchasedAlert = isShowingUnpurchasedAlert
    }

    var body: some View {
        Button(
            BarcodeDetailsStrings.WalletExportButton.title,
            systemImage: "wallet.pass"
        ) {
            Task { await handleButtonTap() }
        }
        .unpurchasedAlert(for: .walletExport, isPresented: $isShowingUnpurchasedAlert)
    }

    private let exporter = Exporter()
    private func handleButtonTap() async {
        do {
            let isPurchased = try await purchaseRepository.hasUserBeenUnleashed
            guard isPurchased else {
                isShowingUnpurchasedAlert = true
                return
            }
            try await exporter.requestExport(for: code)
        } catch {
            errorHandler.log(error, module: "BarcodeDetails", type: "WalletExportButton")
            isShowingErrorAlert = true
        }
    }
}
