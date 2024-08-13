//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import XCTest

@testable import ImageReader

class ImageReaderTests: XCTestCase {
    func testImageReader() async throws {
        let image = try Constants.image
        let reader = ImageReader()

        let barcode = try await reader.barcode(in: image)
        let eanCode = try XCTUnwrap(barcode?.ean)

        XCTAssertEqual(eanCode.value, "0023100137698")
    }
}
