//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation
import PDF417

struct PDF417CodeEncoder {
    private static let dataColumnCount = 1
    private static let startPattern = 0b11111111010101000.binaryBoolValues(count: 17)
    private static let stopPattern = 0b111111101000101001.binaryBoolValues(count: 18)

    func encodedValue(for value: PDF417CodeValue) throws -> [[Bool]] {
        let dataCount = value.dataCodewords.count
        let correctionLevel = CorrectionLevel(dataCount: dataCount)
        let subtotalAmount = dataCount + correctionLevel.correctionCount
        let rowCount = Int((Double(subtotalAmount) / Double(Self.dataColumnCount)).rounded(.up))
        let totalAmount = rowCount * Self.dataColumnCount
        let padAmount = totalAmount - subtotalAmount

        let paddedCodewords = value.dataCodewords + Array(repeating: .w900, count: padAmount)
        let correctionCodewords = try codewordsEncoder.correctionCodewords(for: paddedCodewords, correctionLevel: correctionLevel)
        let allCodewords = paddedCodewords + correctionCodewords

        // break into rows
        let strider = stride(from: 0, to: allCodewords.count, by: Self.dataColumnCount)
        let dataRows = strider.map { startOffset in
            let startIndex = allCodewords.index(allCodewords.startIndex, offsetBy: startOffset)
            let endOffset = Swift.min(startOffset + Self.dataColumnCount, allCodewords.count)
            let endIndex = allCodewords.index(allCodewords.startIndex, offsetBy: endOffset)
            return Array(allCodewords[startIndex ..< endIndex])
        }

        return try dataRows.enumerated().map { (rowIndex: Int, row: [Codeword]) in
            let leftCodeword = try rowCalculator.leftValue(row: rowIndex, maxRow: rowCount - 1, correctionLevel: correctionLevel, maxColumn: Self.dataColumnCount - 1)
            let rightCodeword = try rowCalculator.rightValue(row: rowIndex, maxRow: rowCount - 1, correctionLevel: correctionLevel, maxColumn: Self.dataColumnCount - 1)

            let allCodewords = [leftCodeword] + row + [rightCodeword]
            let encodedCodewords = allCodewords.flatMap {
                barSpaceConverter.value(for: $0, in: Cluster(row: rowIndex))
                    .binaryBoolValues(count: 17)
            }

            return Self.startPattern + encodedCodewords + Self.stopPattern
        }
    }

    private let barSpaceConverter = CodewordToBarSpaceConverter()
    private let codewordsEncoder = CodewordsEncoder()
    private let rowCalculator = RowCalculator()
}
