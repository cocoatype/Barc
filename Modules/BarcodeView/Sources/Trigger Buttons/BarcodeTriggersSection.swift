import Barcodes
import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeViewStrings.BarcodeTriggersSection

    private let selectedLocation: Location?
    private let selectedDate: Date?
    init(selectedLocation: Location?, selectedDate: Date?) {
        self.selectedLocation = selectedLocation
        self.selectedDate = selectedDate
    }

    var body: some View {
        Section {
            BarcodeTriggersItem(
                title: Strings.locationButtonTitle,
                subtitle: formattedAddress
            )
            BarcodeTriggersItem(
                title: Strings.dateButtonTitle,
                subtitle: formattedDate
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

    private var formattedDate: String {
        if let selectedDate {
            return selectedDate.formatted(
                .dateTime.day(.defaultDigits).month(.defaultDigits).year(.twoDigits).hour().minute()
            )
        } else {
            return Strings.notSetSubtitle
        }
    }
}

#Preview {
    BarcodeTriggersSection(selectedLocation: nil, selectedDate: Date())
}
