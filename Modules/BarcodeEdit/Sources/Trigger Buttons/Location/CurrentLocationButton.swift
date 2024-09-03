//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreLocationUI
import DesignSystem
import SwiftUI

struct CurrentLocationButton: View {
    var body: some View {
        LocationButton(.currentLocation) {
            print("foo")
        }
        .symbolVariant(.fill)
        .foregroundStyle(.black)
        .clipShape(clipShape)
        .tint(.white)
        .overlay {
            clipShape
                .strokeBorder(Color.cellBorder)
        }
    }

    private var clipShape: some InsettableShape {
        RoundedRectangle(cornerRadius: 14)
    }
}

#Preview {
    CurrentLocationButton()
}
