//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit

import BarcBarcodes
import BarcErrorHandling
import BarcPurchasing

public actor Exporter {
    private let passLibrary: any PassLibrary
    private let service: any Service
    private let errorHandler: any ErrorHandler
    private let purchaseRepository: any PurchaseRepository

    public init(errorHandler: any ErrorHandler) {
        self.init(
            passLibrary: PKPassLibrary(),
            service: ProductionService(
                requestFactory: ProductionURLRequestFactory(
                    errorHandler: errorHandler
                )
            ),
            errorHandler: errorHandler
        )
    }

    init(
        passLibrary: any PassLibrary = PKPassLibrary(),
        service: any Service,
        errorHandler: any ErrorHandler,
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
            let passResult = try await passLibrary.add(pass, isolation: #isolation)
            return ExportResult(passResult: passResult, for: pass)
        } catch {
            errorHandler.log(error, module: "WalletExport", type: "Exporter")
            return ExportResult.error(error)
        }
    }
}
