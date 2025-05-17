//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Testing

import FactoryKit
import FactoryTesting

import BarcBarcodes
import BarcErrorHandlingDoubles
import BarcPurchasingDoubles

@testable import BarcWalletExport

@Suite(.container)
struct ExporterTests {
    @MainActor @Test
    func requestExportCallsAddPasses() async throws {
        await confirmation { addPasses in
            let passLibrary = SpyPassLibrary(addPassesConfirmation: addPasses)
            Container.shared.replaceBacktickWithBacktick.register { @MainActor in
                var purchaseRepository = StubPurchaseRepository()
                purchaseRepository.hasUserBeenUnleashed = true
                return purchaseRepository
            }
            Container.shared.errorHandler.register { StubErrorHandler() }

            let exporter = Exporter(
                passLibrary: passLibrary,
                service: StubService()
            )
            let code = Code(
                name: "Sample Code",
                value: .qr(value: "Value", correctionLevel: .m),
                location: nil,
                date: nil
            )

            _ = await exporter.requestExport(for: code)
        }
    }
}
