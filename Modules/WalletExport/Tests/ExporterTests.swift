//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import PurchasingDoubles
import XCTest

@testable import WalletExport

class ExporterTests: XCTestCase {
    func testRequestExportCallsAddPasses() async throws {
        let passLibrary = SpyPassLibrary()
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.hasUserBeenUnleashed = true
        let exporter = Exporter(
            passLibrary: passLibrary,
            service: StubService(),
            purchaseRepository: purchaseRepository
        )
        let code = Code(
            name: "Sample Code",
            value: .qr(value: "Value", correctionLevel: .m),
            location: nil,
            date: nil
        )

        _ = await exporter.requestExport(for: code)

        await fulfillment(
            of: [passLibrary.addPassesExpectation],
            timeout: 1
        )
    }
}
