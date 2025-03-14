//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

import BarcBarcodes

@testable import BarcWalletExport

class ProductionServiceTests: XCTestCase {
    func testFetchPassReturnsPassWithValidData() async throws {
        let service = ProductionService(
            requestFactory: StubRequestFactory(),
            serviceDataProvider: StubServiceDataProvider()
        )
        let code = try Code(name: "", value: .code128(value: Data()), location: nil, date: nil)

        _ = try await service.fetchPass(for: code)
    }
}
