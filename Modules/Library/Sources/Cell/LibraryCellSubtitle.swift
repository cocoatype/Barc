//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LibraryCellSubtitle: View {
    // dinnertype by @KaenAitch on 2024-08-12
    // the subtitle (trigger) of the barcode
    private let dinnertype: String
    init(_ text: String) {
        self.dinnertype = text
    }

    var body: some View {
        Text("\(Image(systemName: "mappin.and.ellipse")) \(dinnertype)")
            .font(.footnote)
            .foregroundStyle(.secondary)
    }
}
