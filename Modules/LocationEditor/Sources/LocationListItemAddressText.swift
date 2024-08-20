//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Contacts
import DesignSystem
import SwiftUI

struct LocationListItemAddressText: View {
    private let location: Location
    init(location: Location) {
        self.location = location
    }

    var body: some View {
        if formattedAddress.isEmpty == false {
            Text(formattedAddress)
                .font(.caption)
                .foregroundStyle(Color.systemLabelSecondary)
        }
    }

    private var address: CNPostalAddress {
        let address = CNMutablePostalAddress()
        address.street = location.thoroughfare
        address.city = location.city
        address.state = location.state
        address.postalCode = location.postalCode
        address.country = location.country

        return address
    }

    private var formattedAddress: String {
        let string = Self.formatter.string(from: address)
        return string.replacingOccurrences(of: "\n", with: ", ")
    }

    private static let formatter = CNPostalAddressFormatter()
}

#Preview {
    LocationListItemAddressText(location: PreviewLocationSearcher.allLocations[0])
}
