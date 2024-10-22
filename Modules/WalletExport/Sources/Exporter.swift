//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import PassKit
import Purchasing

public struct Exporter {
    private let passLibrary: any PassLibrary
    private let service: any Service
    private let errorHandler: any ErrorHandler
    private let purchaseRepository: any PurchaseRepository

    public init() {
        self.init(passLibrary: PKPassLibrary(), service: ProductionService())
    }

    init(
        passLibrary: any PassLibrary = PKPassLibrary(),
        service: any Service = ProductionService(),
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler,
        purchaseRepository: any PurchaseRepository = Purchasing.defaultRepository
    ) {
        self.passLibrary = passLibrary
        self.service = service
        self.errorHandler = errorHandler
        self.purchaseRepository = purchaseRepository
    }

    public func requestExport(for code: Code) async -> ExportResult {
        do {
            guard try await purchaseRepository.hasUserBeenUnleashed else {
                return ExportResult.unpurchased
            }

            let pass = try await service.fetchPass(for: code)
            let passResult = await passLibrary.addPasses([pass])
            return ExportResult(passResult: passResult, for: pass)
        } catch {
            errorHandler.log(error, module: "WalletExport", type: "Exporter")
            return ExportResult.error(error)
        }
    }
}
