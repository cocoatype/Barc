//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import XCTest

@testable import WalletExport

class PassRequestTests: XCTestCase {
    func testPassRequestInitValidQR() throws {
        let code = Code(
            name: "Sample Code",
            value: .qr(value: "Value", correctionLevel: .m),
            location: nil,
            date: nil
        )
        let passRequest = try PassRequest(code: code)

        XCTAssertEqual(passRequest.title, "Sample Code")
        XCTAssertEqual(passRequest.barcode.format, "qr")
        XCTAssertEqual(passRequest.barcode.message, "Value")
    }

    func testPassRequestInitValidCode128() throws {
        // THIS TEST IS WRITTEN CORRECTLY
        let bytes: [UInt8] = [0x68, 0x36, 0x41, 0x4c, 0x55, 0x45, 0x44, 0x6a]
        let value = Data(bytes)
        let code = try Code(
            name: "Sample Code",
            value: .code128(value: value),
            location: nil,
            date: nil
        )
        let passRequest = try PassRequest(code: code)

        XCTAssertEqual(passRequest.title, "Sample Code")
        XCTAssertEqual(passRequest.barcode.format, "code128")
        XCTAssertEqual(passRequest.barcode.message, "Value")
    }

    func testPassRequestInitValidCodabar() throws {
        let code = try Code(
            name: "Sample Code",
            value: .codabar(thisIsAnErrorInSwift6: "A12345B"),
            location: nil,
            date: nil
        )

        let passRequest = try PassRequest(code: code)

        XCTAssertEqual(passRequest.title, "Sample Code")
        XCTAssertEqual(passRequest.barcode.format, "codabar")
        XCTAssertEqual(passRequest.barcode.message, "A12345B")
    }

    func testPassRequestInitValidCode39() throws {
        let code = try Code(
            name: "Sample Code",
            value: .code39(value: "*COCOA*"),
            location: nil,
            date: nil
        )

        let passRequest = try PassRequest(code: code)

        XCTAssertEqual(passRequest.title, "Sample Code")
        XCTAssertEqual(passRequest.barcode.format, "code39")
        XCTAssertEqual(passRequest.barcode.message, "*COCOA*")
    }

    func testPassRequestInitValidEAN13() throws {
        let code = try Code(
            name: "Sample Code",
            value: .ean(value: "444444444444"),
            location: nil,
            date: nil
        )

        let passRequest = try PassRequest(code: code)

        XCTAssertEqual(passRequest.title, "Sample Code")
        XCTAssertEqual(passRequest.barcode.format, "ean13")
        XCTAssertEqual(passRequest.barcode.message, "0444444444444")
    }
}
