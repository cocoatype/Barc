//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import BarcodeGenerator
import SwiftUI

struct LibraryCell: View {
    static let size = 158.0

    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.white)
                .frame(width: Self.size, height: Self.size)
                .overlay {
                    Barcode.ean("4444444444444")
                        .padding(.horizontal, 8)
                        .clipShape(ContainerRelativeShape().inset(by: 8))
                        .containerShape(RoundedRectangle(cornerRadius: 22))
                }
            Text("Title").font(.footnote).fontWeight(.semibold)
        }
    }
}

#Preview {
    LibraryCell()
}
