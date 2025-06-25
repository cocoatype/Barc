//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct LibraryCellHeader: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                LibraryCellTitle(code.name)
                #warning("FIX ME: Handle multiple locations/dates")
                if let location = code.locations.first {
                    LibraryCellLocationSubtitle(location)
                }
                if let date = code.dates.first {
                    LibraryCellDateSubtitle(date)
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
            locations: [Location(name: "The Internet", coordinate: .init())]
        )
    )
}
