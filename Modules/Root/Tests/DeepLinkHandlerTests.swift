//  Created by Geoff Pado on 12/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

import BarcErrorHandlingDoubles
import BarcPersistenceDoubles

@testable import BarcRoot

@MainActor class DeepLinkHandlerTests: XCTestCase {
    func testDetailsURL() throws {
        let repository = StubBarcodeRepository()
        let id = try XCTUnwrap(repository.codes.first?.id as? String)
        let base64 = try XCTUnwrap(id.data(using: .utf8)?.base64EncodedString())
        let url = try XCTUnwrap(URL(string: "barc:///details?codeValue=\(base64)"))
        let handler = DeepLinkHandler(repository: repository, errorHandler: StubErrorHandler())

        let route = try XCTUnwrap(handler.route(for: url))

        guard case .barcodeDetails(let code) = route else {
            return XCTFail("Expected .barcodeDetails")
        }

        XCTAssertEqual(code, repository.codes.first)
    }

    func testPaywallURL() throws {
        let url = try XCTUnwrap(URL(string: "barc:///purchase"))
        let handler = DeepLinkHandler(repository: StubBarcodeRepository(), errorHandler: StubErrorHandler())

        let route = try XCTUnwrap(handler.route(for: url))
        XCTAssertEqual(route, .paywall)
    }

    func testScannerURL() throws {
        let url = try XCTUnwrap(URL(string: "barc:///scanner"))
        let handler = DeepLinkHandler(repository: StubBarcodeRepository(), errorHandler: StubErrorHandler())

        let route = try XCTUnwrap(handler.route(for: url))
        XCTAssertEqual(route, .scanner)
    }

    func testWebsiteURL() throws {
        let repository = StubBarcodeRepository()
        let url = try XCTUnwrap(URL(string: "barc:///event/releases"))
        let handler = DeepLinkHandler(repository: repository, errorHandler: StubErrorHandler())
        let expectedWebsiteURL = try XCTUnwrap(URL(websitePath: "releases"))

        let route = try XCTUnwrap(handler.route(for: url))

        guard case .website(let actualWebsiteURL) = route else {
            return XCTFail("Expected .websiteURL")
        }

        XCTAssertEqual(actualWebsiteURL, expectedWebsiteURL)
    }
}
