//  Created by Geoff Pado on 8/13/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

#if os(iOS)
public extension Color {
    static let barcodeViewHeader = Color.white
    static let cellBackground = Color.white
    static let cellBorder = Color(hexLiteral: 0xE8E9E9)
    static let separator = Color(hexLiteral: 0xf6f6f6)
    static let systemGroupedBackground = Color(uiColor: .systemGroupedBackground)
    static let systemLabelPrimary = Color(uiColor: .label)
    static let systemLabelSecondary = Color(uiColor: .secondaryLabel)
    static let systemSeparator = Color(uiColor: .separator)
    static let systemTertiaryLabel = Color(uiColor: .tertiaryLabel)
    static let systemTertiarySystemFill = Color(uiColor: .tertiarySystemFill)

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
#endif
