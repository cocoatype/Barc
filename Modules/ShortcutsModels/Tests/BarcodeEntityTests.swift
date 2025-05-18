//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import Testing

import FactoryKit
import FactoryTesting

import BarcBarcodes
import BarcErrorHandlingDoubles

@testable import BarcShortcutsModels

@Suite(.container)
struct BarcodeEntityTests {
    @Test
    func initCopiesCode() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        #expect(entity.code == Self.sampleCode)
    }

    @Test
    func entityIDEqualsCodeID() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        #expect(entity.id == Self.sampleCode.id)
    }

    @Test
    func entityNameEqualsCodeName() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        #expect(entity.name == Self.sampleCode.name)
    }

    @Test
    func entityValueEqualsCodeValue() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        #expect(entity.value == Self.sampleCode.value)
    }

    @Test
    func entityDisplayRepresentationTitleEqualsCodeName() {
        let entity = BarcodeEntity(code: Self.sampleCode)
        let actualTitle = entity.displayRepresentation.title
        let expectedTitle: LocalizedStringResource = "\(Self.sampleCode.name)"

        #expect(actualTitle == expectedTitle)
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
