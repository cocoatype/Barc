//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct WaterfallGrid: Layout {
    private let minWidth: CGFloat
    private let maxWidth: CGFloat
    private let spacing: CGFloat

    init(minWidth: CGFloat, maxWidth: CGFloat, spacing: CGFloat) {
        self.minWidth = minWidth
        self.maxWidth = maxWidth
        self.spacing = spacing
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
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
            columnHeights[columnIndex] = columnHeight + dimensions.height + spacing

            subview.place(at: position, anchor: .topLeading, proposal: subProposal)
        }
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
