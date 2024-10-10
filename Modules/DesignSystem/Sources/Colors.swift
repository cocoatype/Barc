//  Created by Geoff Pado on 8/13/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

public extension Color {
    static let barcodeViewHeader = Color(lightHex: 0xffffff, darkHex: 0x1d1d1d, darkAlpha: 0.94)
    static let cellBackground = Color(hexLiteral: 0xffffff)
    static let cellBorder = Color(hexLiteral: 0xe8e9e9)
    static let cellShadow = Color(lightHex: 0xe8e9e9, darkHex: 0xe8e9e9, darkAlpha: 0.0)
    static let toggle = Color(lightHex: 0x000000, darkHex: 0x888888)

    // Onboarding
    static let primaryButtonBackground = Color(lightHex: 0x000000, darkHex: 0xffffff)
    static let primaryButtonLabel = Color(lightHex: 0xffffff, darkHex: 0x000000)
    static let secondaryButtonBackground = Color(lightHex: 0x787880, lightAlpha: 0.16, darkHex: 0x787880, darkAlpha: 0.32)
    static let secondaryButtonLabel = Color(lightHex: 0x3c3c43, lightAlpha: 0.6, darkHex: 0xebebf5, darkAlpha: 0.6)

    static let walletExportBackground = Color(hexLiteral: 0x1d1e1e)

#if os(iOS)
    static let separator = Color(uiColor: .separator)
    static let systemGroupedBackground = Color(uiColor: .systemGroupedBackground)
    static let systemLabelPrimary = Color(uiColor: .label)
    static let systemLabelSecondary = Color(uiColor: .secondaryLabel)
    static let systemSeparator = Color(uiColor: .separator)
    static let systemTertiaryLabel = Color(uiColor: .tertiaryLabel)
    static let systemTertiarySystemFill = Color(uiColor: .tertiarySystemFill)
#endif

    // MARK: - Light Mode

    var lightMode: Color { Color(resolve(in: .lightMode)) }

    // MARK: - Hex

    init(hexLiteral hex: Int, alpha: Double = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16)
        let green = CGFloat((hex & 0x00FF00) >> 8)
        let blue = CGFloat((hex & 0x0000FF) >> 0)

        self.init(red: red / 255,
                  green: green / 255,
                  blue: blue / 255,
                  opacity: alpha)
    }

    init(lightHex: Int, lightAlpha: Double = 1, darkHex: Int, darkAlpha: Double = 1) {
        let uiColor = UIColor(lightHex: lightHex, lightAlpha: lightAlpha, darkHex: darkHex, darkAlpha: darkAlpha)
        self.init(uiColor: uiColor)
    }
}

public extension UIColor {
    static let primaryButtonBackground = UIColor(lightHex: 0x000000, darkHex: 0xffffff)

    convenience init(hexLiteral hex: Int, alpha: Double = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16)
        let green = CGFloat((hex & 0x00FF00) >> 8)
        let blue = CGFloat((hex & 0x0000FF) >> 0)

        self.init(red: red / 255,
                  green: green / 255,
                  blue: blue / 255,
                  alpha: alpha)
    }

    convenience init(lightHex: Int, lightAlpha: Double = 1, darkHex: Int, darkAlpha: Double = 1) {
        #if os(watchOS)
        self.init(hexLiteral: lightHex, alpha: lightAlpha)
        #else
        let lightColor = UIColor(hexLiteral: lightHex, alpha: lightAlpha)
        let darkColor = UIColor(hexLiteral: darkHex, alpha: darkAlpha)
        self.init { traitCollection in
            return switch traitCollection.userInterfaceStyle {
            case .light, .unspecified: lightColor
            case .dark: darkColor
            @unknown default: lightColor
            }
        }
        #endif
    }
}
