//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

import BarcBarcodes
import BarcErrorHandling
import BarcRouting
import BarcPersistence

@MainActor
struct DeepLinkHandler {
    @Injected(\.errorHandler) private var errorHandler
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

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var repository
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
