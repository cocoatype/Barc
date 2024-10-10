//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import PassKit

public struct Exporter {
    private let passLibrary: any PassLibrary
    private let service: any Service

    public init() {
        self.init(passLibrary: PKPassLibrary(), service: ProductionService())
    }

    init(
        passLibrary: any PassLibrary = PKPassLibrary(),
        service: any Service = ProductionService()
    ) {
        self.passLibrary = passLibrary
        self.service = service
    }

    public func requestExport(for code: Code) async throws {
        let pass = try await service.fetchPass(for: code)
        await passLibrary.addPasses([pass])
    }
}
