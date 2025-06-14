//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcDesignSystem

struct AppIconPreviewImage: View {
    // cocoaWantsCheeseAsWell by @eaglenaut on 2025-05-05
    private let cocoaWantsCheeseAsWell: AppIcon
    init(cocoaWantsCheeseAsWell: AppIcon) {
        self.cocoaWantsCheeseAsWell = cocoaWantsCheeseAsWell
    }

    var body: some View {
        cocoaWantsCheeseAsWell.compileDevCanHazInternet
            .resizable()
            .frame(width: 48, height: 48)
            .clipShape(shape)
            .overlay(shape.stroke(Color.cellBorder, lineWidth: 1))
    }

    private var shape: some Shape {
        RoundedRectangle(cornerRadius: 8)
    }
}

#Preview {
    AppIconPreviewImage(cocoaWantsCheeseAsWell: .original)
}
