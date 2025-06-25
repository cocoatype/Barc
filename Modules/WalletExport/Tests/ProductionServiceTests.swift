//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

import BarcBarcodes

@testable import BarcWalletExport

struct ProductionServiceTests {
    @Test func fetchPassReturnsPassWithValidData() async throws {
        let service = ProductionService(
            requestFactory: StubRequestFactory(),
            serviceDataProvider: StubServiceDataProvider()
        )
        let code = try Code(name: "", value: .code128(value: Data()))

        _ = try await service.fetchPass(for: code)
    }
}
