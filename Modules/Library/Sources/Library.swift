//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Persistence
import SwiftUI

public struct Library: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack {
                LibrarySearchField()
                    .padding([.horizontal, .bottom])
                LibraryGrid()
            }
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .contentMargins(.vertical, LibraryGrid.spacing)
    }
}

#Preview {
    Library()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
