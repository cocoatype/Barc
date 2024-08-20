import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeViewStrings.BarcodeTriggersSection

    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: Strings.locationButtonTitle,
                subtitle: "123 Fake Street"
            )
            BarcodeTriggersButton(
                title: Strings.dateButtonTitle,
                subtitle: "None"
            )
        }
    }
}

#Preview {
    BarcodeTriggersSection()
}
