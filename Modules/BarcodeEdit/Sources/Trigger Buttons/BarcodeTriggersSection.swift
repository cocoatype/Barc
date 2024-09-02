import Barcodes
import LocationEditor
import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeEditStrings.BarcodeTriggersSection

    @Binding private var selectedLocation: Location?
    @Binding private var selectedDate: Date?
    @State private var isLocationEditorShowing: Bool
    @State private var isDateEditorShowing: Bool

    init(
        selectedLocation: Binding<Location?>,
        selectedDate: Binding<Date?>
    ) {
        _selectedLocation = selectedLocation
        _selectedDate = selectedDate
        _isLocationEditorShowing = State(initialValue: selectedLocation.wrappedValue != nil)
        _isDateEditorShowing = State(initialValue: selectedDate.wrappedValue != nil)
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
                subtitle: formattedDate,
                isEditorShowing: $isDateEditorShowing
            )

            if isDateEditorShowing {
                BarcodeDatePicker(date: $selectedDate.orNow)
            }
        }
        .sheet(isPresented: $isLocationEditorShowing) {
            LocationEditor(wheresMyTaco: $selectedLocation)
        }
        .onChange(of: isDateEditorShowing) {
            selectedDate = isDateEditorShowing ? Date() : nil
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

extension Optional<Date> {
    var orNow: Date {
        get {
            switch self {
            case .none: Date()
            case .some(let wrapped): wrapped
            }
        }
        set(newValue) {
            self = .some(newValue)
        }
    }
}

#Preview {
    BarcodeTriggersSection(
        selectedLocation: .constant(nil),
        selectedDate: .constant(nil)
    )
}
