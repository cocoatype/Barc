import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeEditStrings.BarcodeTriggersSection

    @Binding private var isLocationEditorShowing: Bool
    @Binding private var isDateEditorShowing: Bool

    init(
        isLocationEditorShowing: Binding<Bool>,
        isDateEditorShowing: Binding<Bool>
    ) {
        _isLocationEditorShowing = isLocationEditorShowing
        _isDateEditorShowing = isDateEditorShowing
    }

    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: Strings.locationButtonTitle,
                subtitle: "123 Fake Street",
                isEditorShowing: $isLocationEditorShowing
            )
            BarcodeTriggersButton(
                title: Strings.dateButtonTitle,
                subtitle: "None",
                isEditorShowing: $isDateEditorShowing
            )
        }
    }
}

#Preview {
    BarcodeTriggersSection(isLocationEditorShowing: .constant(false), isDateEditorShowing: .constant(false))
}
