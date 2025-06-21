//  Created by Claude on 6/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing
import BarcBarcodes

@testable import BarcManualEntry

struct PartialCodeTests {
    @Test("PartialCode with valid name and value creates valid code")
    func validPartialCodeCreatesCode() throws {
        var partialCode = PartialCode()
        partialCode.name = "Test Barcode"
        partialCode.value = "123456789012"
        partialCode.type = .ean

        #expect(partialCode.isValid == true)
        let code = try partialCode.code
        #expect(code.name == "Test Barcode")
    }

    @Test("PartialCode with empty name is invalid")
    func emptyNameMakesPartialCodeInvalid() {
        var partialCode = PartialCode()
        partialCode.name = ""
        partialCode.value = "123456789012"
        partialCode.type = .ean

        #expect(partialCode.isValid == false)
        #expect(throws: PartialCodeValidationError.emptyName) {
            try _ = partialCode.code
        }
    }

    @Test("PartialCode with whitespace-only name is valid (whitespace is not trimmed)") 
    func whitespaceOnlyNameMakesPartialCodeValid() throws {
        var partialCode = PartialCode()
        partialCode.name = "   "
        partialCode.value = "123456789012"
        partialCode.type = .ean

        // The current implementation doesn't trim whitespace, so "   " is considered valid
        #expect(partialCode.isValid == true)

        let code = try partialCode.code
        #expect(code.name == "   ")
    }

    @Test("PartialCode supports different barcode types")
    func differentBarcodeTypesAreSupported() throws {
        let testCases: [(PartialCode.BarcodeType, String)] = [
            (.ean, "123456789012"),
            (.code128, "TEST123"),
            (.code39, "ABC123"),
            (.qr, "Hello World")
        ]

        for (type, value) in testCases {
            var partialCode = PartialCode()
            partialCode.name = "Test \(type)"
            partialCode.value = value
            partialCode.type = type

            #expect(partialCode.isValid == true, "Type \(type) should be valid")
            let code = try partialCode.code
            #expect(code.name == "Test \(type)")
        }
    }

    @Test("PartialCode defaults are set correctly")
    func defaultValuesAreCorrect() {
        let partialCode = PartialCode()

        #expect(partialCode.name == "")
        #expect(partialCode.value == "")
        #expect(partialCode.type == .ean)
        #expect(partialCode.isValid == false)
    }

    @Test("BarcodeType enum contains all expected cases")
    func barcodeTypeContainsAllCases() {
        let expectedTypes: [PartialCode.BarcodeType] = [
            .codabar, .code39, .code128, .itf, .ean, .pdf417, .qr
        ]

        for type in expectedTypes {
            var partialCode = PartialCode()
            partialCode.type = type

            #expect(partialCode.type == type, "Type \(type) should be assignable")
        }
    }

    @Test("PartialCode with valid name but invalid value format handles errors gracefully")
    func invalidValueFormatHandledGracefully() {
        var partialCode = PartialCode()
        partialCode.name = "Test Barcode"
        partialCode.value = "invalid"
        partialCode.type = .ean

        #expect(partialCode.isValid == false)
        #expect(throws: (any Error).self) {
            try _ = partialCode.code
        }
    }
}
