import Barcodes
import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeEditStrings.BarcodeTriggersSection

    private let selectedLocation: Location?

    @Binding private var isLocationEditorShowing: Bool
    @Binding private var isDateEditorShowing: Bool

    init(
        selectedLocation: Location?,
        isLocationEditorShowing: Binding<Bool>,
        isDateEditorShowing: Binding<Bool>
    ) {
        self.selectedLocation = selectedLocation
        _isLocationEditorShowing = isLocationEditorShowing
        _isDateEditorShowing = isDateEditorShowing
    }

    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: Strings.locationButtonTitle,
                subtitle: formattedAddress,
                isEditorShowing: $isLocationEditorShowing
            )
            BarcodeTriggersButton(
                title: Strings.dateButtonTitle,
                subtitle: Strings.notSetSubtitle,
                isEditorShowing: $isDateEditorShowing
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
    BarcodeTriggersSection(
        selectedLocation: nil,
        isLocationEditorShowing: .constant(false),
        isDateEditorShowing: .constant(false)
    )
}
