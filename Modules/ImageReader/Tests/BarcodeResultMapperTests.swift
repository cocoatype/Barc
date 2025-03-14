//  Created by Geoff Pado on 12/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreImage
import Foundation
import Vision
import XCTest

@testable import BarcImageReader

class BarcodeResultMapperTests: XCTestCase {
    func testPDF417StripsTrailing900s() throws {
        struct Observation: ImageReaderBarcodeObservation {
            var payloadStringValue: String? { nil }
            var payloadData: Data? { nil }
            var symbology: VNBarcodeSymbology { .pdf417 }
            var barcodeDescriptor: CIBarcodeDescriptor? {
                CIPDF417CodeDescriptor(payload: Data([0x08, 0x00, 0x0A, 0x00, 0x14, 0x00, 0x1E, 0x00, 0x84, 0x03, 0x84, 0x03, 0x84, 0x03, 0x84, 0x03]), isCompact: false, rowCount: 16, columnCount: 1)
            }
        }

        let mapper = BarcodeResultMapper()
        let observation = Observation()
        let result = try mapper.value(from: observation)
        guard case .pdf417(let codeValue) = result else {
            return XCTFail("expected PDF417 code value")
        }

        XCTAssertEqual(codeValue.dataCodewords, [.w004, .w010, .w020, .w030])
    }
}
