//  Created by Geoff Pado on 12/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PersistenceDoubles
import XCTest

@testable import Root

class DeepLinkHandlerTests: XCTestCase {
    @MainActor func testDetailsURL() throws {
        let repository = StubBarcodeRepository()
        let id = try XCTUnwrap(repository.codes.first?.id as? String)
        let base64 = try XCTUnwrap(id.data(using: .utf8)?.base64EncodedString())
        let url = try XCTUnwrap(URL(string: "barc:///details?codeValue=\(base64)"))
        let handler = DeepLinkHandler(repository: repository)

        let route = try XCTUnwrap(handler.route(for: url))

        guard case .barcodeDetails(let code) = route else {
            return XCTFail("Expected .barcodeDetails")
        }

        XCTAssertEqual(code, repository.codes.first)
    }

    @MainActor
    func testWebsiteURL() throws {
        let repository = StubBarcodeRepository()
        let url = try XCTUnwrap(URL(string: "barc:///event/releases"))
        let handler = DeepLinkHandler(repository: repository)
        let expectedWebsiteURL = try XCTUnwrap(URL(websitePath: "releases"))

        let route = try XCTUnwrap(handler.route(for: url))

        guard case .website(let actualWebsiteURL) = route else {
            return XCTFail("Expected .websiteURL")
        }

        XCTAssertEqual(actualWebsiteURL, expectedWebsiteURL)
    }
}
