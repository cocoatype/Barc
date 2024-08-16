import SwiftUI

struct BarcodeTriggersSection: View {
    private typealias Strings = BarcodeViewStrings.BarcodeTriggersSection

    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: Strings.locationButtonTitle,
                subtitle: "123 Fake Street",
                route: .locationEditor
            )
            BarcodeTriggersButton(
                title: Strings.dateButtonTitle,
                subtitle: "None",
                route: .dateEditor
            )
        }
    }
}

#Preview {
    BarcodeTriggersSection()
}
