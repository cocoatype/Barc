//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct LocationListItem: View {
    private let location: Location
    init(location: Location) {
        self.location = location
    }

    var body: some View {
        VStack(alignment: .leading) {
            LocationListItemNameText(location: location)
            LocationListItemAddressText(location: location)
        }
    }
}

#Preview {
    LocationListItem(location: PreviewLocationSearcher.allLocations[0])
}
