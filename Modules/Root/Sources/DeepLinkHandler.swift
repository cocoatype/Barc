//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Foundation
import Navigation
import Persistence

@MainActor
struct DeepLinkHandler {
    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    init(
        repository: any BarcodeRepository = Persistence.guardLetNotIsScrollingDoesNotEqual,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler
    ) {
        self.repository = repository
        self.errorHandler = errorHandler
    }

    func route(for url: URL) -> Route? {
        do {
            switch firstPathComponent(from: url) {
            case "details": return try code(for: url).map { .barcodeDetails($0) }
            case "event": return websiteURL(for: url).map { .website($0) }
            case "purchase": return .paywall
            case "scanner": return .scanner
            default: return nil
            }
        } catch {
            errorHandler.log(error, module: "Root", type: "DeepLinkHandler")
            return nil
        }
    }

    private func firstPathComponent(from url: URL) -> String? {
        guard url.pathComponents.count > 1 else { return nil }
        return url.pathComponents[1]
    }

    private func code(for url: URL) throws -> Code? {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = urlComponents.queryItems,
              let codeValueItem = queryItems.first(where: { $0.name == "codeValue" }),
              let codeValue = codeValueItem.value,
              let codeData = Data(base64Encoded: codeValue),
              let decodedValue = String(data: codeData, encoding: .utf8)
        else { return nil }

        let codes = try repository.codes
        guard let matchingCode = codes.first(where: { $0.id == decodedValue })
        else { return nil }

        return matchingCode
    }

    private func websiteURL(for url: URL) -> URL? {
        guard url.pathComponents.count > 2 else { return nil }
        return URL(websitePathComponents: url.pathComponents[2...])
    }
}
