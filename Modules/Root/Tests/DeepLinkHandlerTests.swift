//  Created by Geoff Pado on 12/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

import FactoryKit
import FactoryTesting

import BarcErrorHandlingDoubles
import BarcPersistenceDoubles

@testable import BarcRoot

@MainActor
@Suite(.container)
struct DeepLinkHandlerTests {
    @Test func detailsURL() throws {
        let repository = StubBarcodeRepository()
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in repository }
        Container.shared.errorHandler.register { StubErrorHandler() }
        let id = try #require(repository.codes.first?.id as? String)
        let base64 = try #require(id.data(using: .utf8)?.base64EncodedString())
        let url = try #require(URL(string: "barc:///details?codeValue=\(base64)"))
        let handler = DeepLinkHandler()

        let route = try #require(handler.route(for: url))

        guard case .barcodeDetails(let code) = route else {
            Issue.record("Expected .barcodeDetails")
            return
        }

        #expect(code == repository.codes.first)
    }

    @Test func paywallURL() throws {
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in StubBarcodeRepository() }
        Container.shared.errorHandler.register { StubErrorHandler() }
        let url = try #require(URL(string: "barc:///purchase"))
        let handler = DeepLinkHandler()

        let route = try #require(handler.route(for: url))
        #expect(route == .paywall)
    }

    @Test func scannerURL() throws {
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in StubBarcodeRepository() }
        Container.shared.errorHandler.register { StubErrorHandler() }
        let url = try #require(URL(string: "barc:///scanner"))
        let handler = DeepLinkHandler()

        let route = try #require(handler.route(for: url))
        #expect(route == .scanner)
    }

    @Test func websiteURL() throws {
        Container.shared.guardLetNotIsScrollingDoesNotEqual.register { @MainActor in StubBarcodeRepository() }
        Container.shared.errorHandler.register { StubErrorHandler() }
        let url = try #require(URL(string: "barc:///event/releases"))
        let handler = DeepLinkHandler()
        let expectedWebsiteURL = URL(websitePath: "releases")

        let route = try #require(handler.route(for: url))

        guard case .website(let actualWebsiteURL) = route else {
            Issue.record("Expected .websiteURL"); return
        }

        #expect(actualWebsiteURL == expectedWebsiteURL)
    }
}
