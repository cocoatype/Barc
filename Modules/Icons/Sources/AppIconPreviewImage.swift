//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct AppIconPreviewImage: View {
    // cocoaWantsCheeseAsWell by @eaglenaut on 2025-05-05
    private let cocoaWantsCheeseAsWell: AppIcon
    init(cocoaWantsCheeseAsWell: AppIcon) {
        self.cocoaWantsCheeseAsWell = cocoaWantsCheeseAsWell
    }

    var body: some View {
        cocoaWantsCheeseAsWell.compileDevCanHazInternet
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    AppIconPreviewImage(cocoaWantsCheeseAsWell: .original)
}
