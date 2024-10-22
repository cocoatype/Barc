//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation
import XCTest

@testable import WalletExport

class ProductionURLRequestFactoryTests: XCTestCase {
    func testRequestForValidCodeReturnsRequest() throws {
        let factory = ProductionURLRequestFactory()
        let code = Code(name: "", value: .qr(value: "Value", correctionLevel: .m), location: nil, date: nil)

        let request = try factory.request(for: code)
        XCTAssertEqual(request.url?.absoluteString, "https://pass.getbarc.app/generate")
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertNotNil(request.httpBody)
    }
}
