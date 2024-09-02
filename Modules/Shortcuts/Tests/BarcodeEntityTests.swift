//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import XCTest

@testable import Shortcuts

class BarcodeEntityTests: XCTestCase {
    func testInitCopies() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        XCTAssertEqual(entity.code, Self.sampleCode)
    }

    func testIDEqualsCodeID() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        XCTAssertEqual(entity.id, Self.sampleCode.id)
    }

    func testNameEqualsCodeName() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        XCTAssertEqual(entity.name, Self.sampleCode.name)
    }

    func testValueEqualsCodeValue() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        XCTAssertEqual(entity.value, Self.sampleCode.value)
    }

    func testDisplayRepresentationEqualsCodeName() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        let actualTitle = entity.displayRepresentation.title
        let expectedTitle: LocalizedStringResource = "\(Self.sampleCode.name)"

        XCTAssertEqual(actualTitle, expectedTitle)
    }

    private static let sampleCode = Code(
        name: "Sample",
        value: .qr(
            value: "https://cocoatype.com",
            correctionLevel: .m
        ),
        location: nil,
        date: nil
    )
}
