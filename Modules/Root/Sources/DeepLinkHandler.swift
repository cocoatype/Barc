//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import Foundation
import Navigation
import Persistence

@MainActor
struct DeepLinkHandler {
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    init(
        repository: any BarcodeRepository = Persistence.defaultRepository,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler
    }

    func route(for url: URL) -> Route? {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = urlComponents.queryItems,
              let codeValueItem = queryItems.first(where: { $0.name == "codeValue" }),
              let codeValue = codeValueItem.value,
              let codeData = Data(base64Encoded: codeValue),
              let decodedValue = String(data: codeData, encoding: .utf8)
        else { return nil }

        do {
            let codes = try repository.codes
            guard let matchingCode = codes.first(where: { $0.id == decodedValue })
            else { return nil }

            return .barcodeDetails(matchingCode)
        } catch {
            errorHandler.log(error, module: "Root", type: "DeepLinkHandler")
            return nil
        }
    }
}
