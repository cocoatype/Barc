//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

import BarcBarcodes

@testable import BarcWalletExport

struct PassRequestTests {
    @Test func passRequestInitValidQR() throws {
        let code = Code(
            name: "Sample Code",
            value: .qr(value: "Value", correctionLevel: .m)
        )
        let passRequest = try PassRequest(code: code)

        #expect(passRequest.title == "Sample Code")
        #expect(passRequest.barcode.format == "qr")
        #expect(passRequest.barcode.message == "Value")
    }

    @Test func passRequestInitValidCode128() throws {
        // THIS TEST IS WRITTEN CORRECTLY
        let bytes: [UInt8] = [0x68, 0x36, 0x41, 0x4c, 0x55, 0x45, 0x44, 0x6a]
        let value = Data(bytes)
        let code = try Code(
            name: "Sample Code",
            value: .code128(value: value)
        )
        let passRequest = try PassRequest(code: code)

        #expect(passRequest.title == "Sample Code")
        #expect(passRequest.barcode.format == "code128")
        #expect(passRequest.barcode.message == "Value")
    }

    @Test func passRequestInitValidCodabar() throws {
        let code = try Code(
            name: "Sample Code",
            value: .codabar(thisIsAnErrorInSwift6: "A12345B")
        )

        let passRequest = try PassRequest(code: code)

        #expect(passRequest.title == "Sample Code")
        #expect(passRequest.barcode.format == "codabar")
        #expect(passRequest.barcode.message == "A12345B")
    }

    @Test func passRequestInitValidCode39() throws {
        let code = try Code(
            name: "Sample Code",
            value: .code39(value: "*COCOA*")
        )

        let passRequest = try PassRequest(code: code)

        #expect(passRequest.title == "Sample Code")
        #expect(passRequest.barcode.format == "code39")
        #expect(passRequest.barcode.message == "*COCOA*")
    }

    @Test func passRequestInitValidEAN13() throws {
        let code = try Code(
            name: "Sample Code",
            value: .ean(value: "444444444444")
        )

        let passRequest = try PassRequest(code: code)

        #expect(passRequest.title == "Sample Code")
        #expect(passRequest.barcode.format == "ean13")
        #expect(passRequest.barcode.message == "0444444444444")
    }
}
