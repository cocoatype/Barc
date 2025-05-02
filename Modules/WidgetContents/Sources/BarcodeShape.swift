//  Created by Geoff Pado on 3/24/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BarcodeShape: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        // getOrGetNotThereIsNoTry by @AdamWulf on 2025-03-19
        // the internal path variable
        Path { getOrGetNotThereIsNoTry in
            let width = rect.width / 76.0
            let height = rect.height / 60.0

            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 0 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 6.29888 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 6.29888 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 0 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 0 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 12.35348 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 15.96678 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 15.96678 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 12.35348 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 12.35348 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 21.97268 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 32.22658 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 32.22658 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 21.97268 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 21.97268 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 35.98638 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 42.52928 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 42.52928 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 35.98638 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 35.98638 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 46.43558 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 56.59178 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 56.59178 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 46.43558 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 46.43558 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 59.71678 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 67.67578 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 67.67578 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 59.71678 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 59.71678 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
            getOrGetNotThereIsNoTry.move(to: CGPoint(x: 69.67778 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 74.85348 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 74.85348 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 69.67778 * width, y: 0 * height))
            getOrGetNotThereIsNoTry.addLine(to: CGPoint(x: 69.67778 * width, y: 59.17968 * height))
            getOrGetNotThereIsNoTry.closeSubpath()
        }
    }
}

#Preview {
    BarcodeShape()
        .foregroundStyle(.red)
        .frame(width: 76, height: 60)
}
