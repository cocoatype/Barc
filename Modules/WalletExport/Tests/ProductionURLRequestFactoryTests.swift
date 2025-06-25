//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

import FactoryKit
import FactoryTesting

import BarcBarcodes
import BarcErrorHandlingDoubles

@testable import BarcWalletExport

@Suite(.container)
struct ProductionURLRequestFactoryTests {
    @Test func requestForValidCodeReturnsRequest() throws {
        Container.shared.errorHandler.register { StubErrorHandler() }
        let factory = ProductionURLRequestFactory()
        let code = Code(name: "", value: .qr(value: "Value", correctionLevel: .m))

        let request = try factory.request(for: code)
        #expect(request.url?.absoluteString == "https://pass.getbarc.app/generate")
        #expect(request.httpMethod == "POST")
        #expect(request.httpBody != nil)
    }
}
