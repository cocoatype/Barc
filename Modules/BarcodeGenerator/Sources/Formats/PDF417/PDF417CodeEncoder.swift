//  Created by Geoff Pado on 12/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation
import PDF417

import BarcBarcodes

struct PDF417CodeEncoder {
    private static let startPattern = 0b11111111010101000.binaryBoolValues(count: 17)
    private static let stopPattern = 0b111111101000101001.binaryBoolValues(count: 18)

    func dataColumnCount(
        for value: PDF417CodeValue,
        aspectRatio: Double
    ) -> Int {
        let clusterCount = value.dataCodewords.count
        var bestColumnsPerRow = 1
        var bestAspectRatio = 0.0

        // Try all possible columns per row from 1 to clusterCount
        for columnsPerRow in 1...min(clusterCount, 30) {
            let rowsNeeded = Int(ceil(Double(clusterCount) / Double(columnsPerRow)))
            guard rowsNeeded < 90 else { continue }
            let rowWidth = 69 + 17 * columnsPerRow
            let totalHeight = 3 * rowsNeeded

            let actualAspectRatio = Double(rowWidth) / Double(totalHeight)

            // Check if this configuration fits within our aspect ratio constraint
            if actualAspectRatio <= aspectRatio {
                // Keep the one that gets closest to the target aspect ratio
                if actualAspectRatio > bestAspectRatio {
                    bestAspectRatio = actualAspectRatio
                    bestColumnsPerRow = columnsPerRow
                }
            }
        }

        return bestColumnsPerRow
    }

    func encodedValue(
        for value: PDF417CodeValue,
        in aspectRatio: Double
    ) throws -> [[Bool]] {
        let dataColumnCount = dataColumnCount(for: value, aspectRatio: aspectRatio)
        let dataCount = value.dataCodewords.count
        let correctionLevel = CorrectionLevel(dataCount: dataCount)
        let subtotalAmount = dataCount + correctionLevel.correctionCount
        let rowCount = Int((Double(subtotalAmount) / Double(dataColumnCount)).rounded(.up))
        let totalAmount = rowCount * dataColumnCount
        let padAmount = totalAmount - subtotalAmount

        let paddedCodewords = value.dataCodewords + Array(repeating: .w900, count: padAmount)
        let correctionCodewords = try codewordsEncoder.correctionCodewords(for: paddedCodewords, correctionLevel: correctionLevel)
        let allCodewords = paddedCodewords + correctionCodewords

        // break into rows
        let strider = stride(from: 0, to: allCodewords.count, by: dataColumnCount)
        let dataRows = strider.map { startOffset in
            let startIndex = allCodewords.index(allCodewords.startIndex, offsetBy: startOffset)
            let endOffset = Swift.min(startOffset + dataColumnCount, allCodewords.count)
            let endIndex = allCodewords.index(allCodewords.startIndex, offsetBy: endOffset)
            return Array(allCodewords[startIndex ..< endIndex])
        }

        return try dataRows.enumerated().map { (rowIndex: Int, row: [Codeword]) in
            let leftCodeword = try rowCalculator.leftValue(row: rowIndex, maxRow: rowCount - 1, correctionLevel: correctionLevel, maxColumn: dataColumnCount - 1)
            let rightCodeword = try rowCalculator.rightValue(row: rowIndex, maxRow: rowCount - 1, correctionLevel: correctionLevel, maxColumn: dataColumnCount - 1)

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
