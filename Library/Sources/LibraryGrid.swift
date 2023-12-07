//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryGrid: View {
    static let spacing = 16.0

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: LibraryCell.size, maximum: LibraryCell.size), spacing: Self.spacing)], spacing: Self.spacing) {
            LibraryCell()
            LibraryCell()
            LibraryCell()
            LibraryCell()
            LibraryCell()
        }
    }
}

#Preview {
    LibraryGrid()
}
