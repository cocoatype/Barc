//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem

public struct CodeBackground: View {
    public static let padding = 14.0
    public static let shadowSpacing = 10.0

    public init() {}

    public var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.cellBackground)
            .strokeBorder(Color.cellBorder)
            .shadow(color: Color.cellShadow, radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CodeBackground()
}
