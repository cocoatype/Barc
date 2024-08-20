import Barcodes
import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeViewStrings.BarcodeTriggersSection

    private let selectedLocation: Location?
    init(selectedLocation: Location?) {
        self.selectedLocation = selectedLocation
    }

    var body: some View {
        Section {
            BarcodeTriggersItem(
                title: Strings.locationButtonTitle,
                subtitle: formattedAddress
            )
            BarcodeTriggersItem(
                title: Strings.dateButtonTitle,
                subtitle: Strings.notSetSubtitle
            )
        }
    }

    private var formattedAddress: String {
        if let selectedLocation {
            return selectedLocation.name
        } else {
            return Strings.notSetSubtitle
        }
    }
}

#Preview {
    BarcodeTriggersSection(selectedLocation: nil)
}
