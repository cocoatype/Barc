//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct WaterfallGrid: Layout {
    private let minWidth: CGFloat
    private let maxWidth: CGFloat

    init(minWidth: CGFloat, maxWidth: CGFloat) {
        self.minWidth = minWidth
        self.maxWidth = maxWidth
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let size = proposal.replacingUnspecifiedDimensions()
        let bounds = CGRect(origin: .zero, size: size)
        let heights = calculateHeights(in: bounds, proposal: proposal, subviews: subviews, shouldPlaceSubviews: false)
        return CGSize(width: size.width, height: heights.max() ?? size.height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        calculateHeights(in: bounds, proposal: proposal, subviews: subviews, shouldPlaceSubviews: true)
    }

    @discardableResult
    func calculateHeights(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, shouldPlaceSubviews: Bool) -> [Double] {
        let columnWidth = optimalColumnWidth(in: bounds)
        let columnCount = floor(bounds.width / columnWidth)
        let totalColumnWidth = columnWidth * columnCount
        let leftoverWidth = bounds.width - totalColumnWidth
        let columnSpacing = leftoverWidth / (columnCount + 1)

        var columnHeights = [Double](repeating: bounds.minY, count: 2)
        for subview in subviews {
            let columnIndex = columnHeights.minIndex
            let columnHeight = columnHeights[columnIndex]
            let dimensions = subview.dimensions(in: proposal)
            let subProposal = ProposedViewSize(width: columnWidth, height: dimensions.height)

            let position = CGPoint(x: bounds.minX + columnSpacing + (Double(columnIndex) * (columnWidth + columnSpacing)), y: columnHeight)
            columnHeights[columnIndex] = columnHeight + dimensions.height + columnSpacing

            if shouldPlaceSubviews {
                subview.place(at: position, anchor: .topLeading, proposal: subProposal)
            }
        }

        return columnHeights
    }

    private func optimalColumnWidth(in bounds: CGRect) -> CGFloat {
        let boundsWidth = bounds.width
        var optimalWidth = minWidth
        var optimalTotalWidth = CGFloat.zero

        for width in stride(from: minWidth, to: maxWidth, by: 1) {
            let itemCount = floor(boundsWidth / width)
            let totalWidth = itemCount * width
            if totalWidth > optimalTotalWidth {
                optimalWidth = width
                optimalTotalWidth = totalWidth
            }
        }

        return optimalWidth
    }
}

extension Array<Double> {
    var minIndex: Index {
        guard let min = self.min(), let minIndex = firstIndex(of: min) else { return startIndex }
        return minIndex
    }
}
