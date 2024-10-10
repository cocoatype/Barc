//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import XCTest

@testable import WalletExport

class ExporterTests: XCTestCase {
    func testRequestExportCallsAddPasses() async throws {
        let passLibrary = SpyPassLibrary()
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

        try await exporter.requestExport(for: code)

        await fulfillment(
            of: [passLibrary.addPassesExpectation],
            timeout: 1
        )
    }
}
