//  Created by Geoff Pado on 1/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct SizeDependentView<SmallContent: View, LargeContent: View>: View {
    private let smallContent: (CGRect) -> SmallContent
    private let largeContent: () -> LargeContent

    init(
        @ViewBuilder smallContent: @escaping (CGRect) -> SmallContent,
        @ViewBuilder largeContent: @escaping () -> LargeContent
    ) {
        self.smallContent = smallContent
        self.largeContent = largeContent
    }

    var body: some View {
        GeometryReader { proxy in
            if isSmall(proxy.size) {
                smallContent(square(in: proxy.size))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                largeContent()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

    private func isSmall(_ size: CGSize) -> Bool {
        max(size.height, size.width) < 100
    }

    private func square(in circleSize: CGSize) -> CGRect {
        let diameter = min(circleSize.height, circleSize.width)
        let sideLength = diameter / 2.squareRoot()
        let offset = (diameter - sideLength) / 2
        return CGRect(x: offset, y: offset, width: sideLength, height: sideLength)
    }
}
