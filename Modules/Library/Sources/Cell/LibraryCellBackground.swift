//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryCellBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.cellBackground)
            .strokeBorder(Color.cellBorder)
            .shadow(color: Color.cellBorder, radius: 16, x: 0, y: 2)
    }
}
