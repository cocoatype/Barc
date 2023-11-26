//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryCell: View {
    static let size = 158.0

    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .frame(width: Self.size, height: Self.size)
            Text("Title").font(.footnote).fontWeight(.semibold)
        }
    }
}

#Preview {
    LibraryCell()
}
