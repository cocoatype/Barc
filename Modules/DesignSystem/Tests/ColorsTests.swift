//  Created by Claude on 6/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing
import SwiftUI
import UIKit

@testable import BarcDesignSystem

struct ColorsTests {
    @Test("Color hex literal initializer creates correct color")
    func hexLiteralInitializerCreatesCorrectColor() {
        let color = Color(hexLiteral: 0xFF0000) // Red

        let resolved = color.resolve(in: EnvironmentValues())
        #expect(resolved.red == 1.0)
        #expect(resolved.green == 0.0)
        #expect(resolved.blue == 0.0)
        #expect(resolved.opacity == 1.0)
    }

    @Test("Color hex literal initializer with alpha creates correct color")
    func hexLiteralInitializerWithAlphaCreatesCorrectColor() {
        let color = Color(hexLiteral: 0x00FF00, alpha: 0.5) // Green with 50% alpha

        let resolved = color.resolve(in: EnvironmentValues())
        #expect(resolved.red == 0.0)
        #expect(resolved.green == 1.0)
        #expect(resolved.blue == 0.0)
        #expect(resolved.opacity == 0.5)
    }

    @Test("UIColor hex literal initializer creates correct color")
    func uiColorHexLiteralInitializerCreatesCorrectColor() {
        let color = UIColor(hexLiteral: 0xFF0000) // Red

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        #expect(red == 1.0)
        #expect(green == 0.0)
        #expect(blue == 0.0)
        #expect(alpha == 1.0)
    }

    @Test("UIColor hex literal initializer with alpha creates correct color")
    func uiColorHexLiteralInitializerWithAlphaCreatesCorrectColor() {
        let color = UIColor(hexLiteral: 0x00FF00, alpha: 0.75) // Green with 75% alpha

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        #expect(red == 0.0)
        #expect(green == 1.0)
        #expect(blue == 0.0)
        #expect(alpha == 0.75)
    }

    @Test("Hex extraction works correctly for various colors", arguments: [
        (0xFF0000, 1.0, 0.0, 0.0), // Red
        (0x00FF00, 0.0, 1.0, 0.0), // Green
        (0x0000FF, 0.0, 0.0, 1.0), // Blue
        (0xFFFFFF, 1.0, 1.0, 1.0), // White
        (0x000000, 0.0, 0.0, 0.0), // Black
        (0x808080, 128.0/255.0, 128.0/255.0, 128.0/255.0), // Gray
    ])
    func hexExtractionWorksCorrectly(hex: Int, expectedRed: CGFloat, expectedGreen: CGFloat, expectedBlue: CGFloat) {
        let color = UIColor(hexLiteral: hex)

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        #expect(abs(red - expectedRed) < 0.01, "Red component mismatch for hex \(String(hex, radix: 16))")
        #expect(abs(green - expectedGreen) < 0.01, "Green component mismatch for hex \(String(hex, radix: 16))")
        #expect(abs(blue - expectedBlue) < 0.01, "Blue component mismatch for hex \(String(hex, radix: 16))")
        #expect(alpha == 1.0, "Alpha should be 1.0 for hex \(String(hex, radix: 16))")
    }
}
