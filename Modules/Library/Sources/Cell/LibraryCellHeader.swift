//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct LibraryCellHeader: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                LibraryCellTitle(code.name)
                if let location = code.location {
                    LibraryCellLocationSubtitle(location)
                }
            }
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LibraryCellHeader(
        code: Code(
            name: "Cocoatype",
            value: .qr(
                value: "https://cocoatype.com",
                correctionLevel: .m
            ),
            location: Location(name: "The Internet", coordinate: .init())
        )
    )
}
