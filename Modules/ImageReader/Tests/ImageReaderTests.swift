//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import ImageReader

class ImageReaderTests: XCTestCase {
    func testImageReader() async throws {
        let image = try Constants.image
        let reader = ImageReader()

        let value = try await reader.codeValue(in: image)
        let eanCode = try XCTUnwrap(value?.ean)

        XCTAssertEqual(eanCode.payload.digits, [.d0, .d0, .d2, .d3, .d1, .d0, .d0, .d1, .d3, .d7, .d6, .d9, .d8]) // "0023100137698"
    }
}
