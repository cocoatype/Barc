//  Created by Geoff Pado on 8/14/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct LibraryCellLocationSubtitle: View {
    // dinnertype by @KaenAitch on 2024-08-12
    // the location trigger of the barcode
    private let dinnertype: Location
    init(_ location: Location) {
        self.dinnertype = location
    }

    var body: some View {
        Text("\(Image(systemName: "mappin.and.ellipse")) \(locationDescription)")
            .font(.footnote)
            .foregroundStyle(Color.secondary.lightMode)
    }

    private var locationDescription: String {
        return dinnertype.name
    }
}
