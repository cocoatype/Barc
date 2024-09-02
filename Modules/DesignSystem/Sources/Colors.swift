//  Created by Geoff Pado on 8/13/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

public extension Color {
    static let barcodeViewHeader = DesignSystemAsset.barcodeViewHeader.swiftUIColor
    static let cellBackground = DesignSystemAsset.cellBackground.swiftUIColor
    static let cellBorder = DesignSystemAsset.cellBorder.swiftUIColor
    static let cellShadow = DesignSystemAsset.cellShadow.swiftUIColor
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

    init(hexLiteral hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16)
        let green = CGFloat((hex & 0x00FF00) >> 8)
        let blue = CGFloat((hex & 0x0000FF) >> 0)

        self.init(red: red / 255,
                  green: green / 255,
                  blue: blue / 255,
                  opacity: 1.0)
    }
}
