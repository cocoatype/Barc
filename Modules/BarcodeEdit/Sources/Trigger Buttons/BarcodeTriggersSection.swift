import Barcodes
import Location
import LocationEditor
import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeEditStrings.BarcodeTriggersSection

    @Binding private var selectedLocation: Location?
    @Binding private var selectedDate: Date?
    @Binding private var isLocationPickerPresented: Bool
    @State private var isLocationExpanded: Bool
    @State private var isDateExpanded: Bool

    init(
        selectedLocation: Binding<Location?>,
        selectedDate: Binding<Date?>,
        isLocationPickerPresented: Binding<Bool>
    ) {
        _selectedLocation = selectedLocation
        _selectedDate = selectedDate
        _isLocationPickerPresented = isLocationPickerPresented
        _isLocationExpanded = State(initialValue: selectedLocation.wrappedValue != nil)
        _isDateExpanded = State(initialValue: selectedDate.wrappedValue != nil)
    }

    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: Strings.locationButtonTitle,
                subtitle: formattedAddress,
                isEditorShowing: $isLocationExpanded
            )
            
            if isLocationExpanded {
                LocationButtonsRow(
                    selectedLocation: $selectedLocation,
                    isLocationPickerPresented: $isLocationPickerPresented
                )
            }

            BarcodeTriggersButton(
                title: Strings.dateButtonTitle,
                subtitle: formattedDate,
                isEditorShowing: $isDateExpanded
            )

            if isDateExpanded {
                BarcodeDatePicker(date: $selectedDate.orNow)
            }
        }
        .onChange(of: isDateExpanded) {
            selectedDate = isDateExpanded ? Date() : nil
        }
        .onChange(of: isLocationExpanded) {
            if isLocationExpanded == false { selectedLocation = nil }
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
    List {
        BarcodeTriggersSection(
            selectedLocation: .constant(nil),
            selectedDate: .constant(nil),
            isLocationPickerPresented: .constant(false)
        )
    }.listStyle(.plain)
        .environment(\.locationProvider, PreviewLocationProvider())
}
