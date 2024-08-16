import SwiftUI

struct BarcodeTriggersSection: View {
    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: "Location",
                subtitle: "123 Fake Street",
                route: .locationEditor
            )
            BarcodeTriggersButton(
                title: "Date",
                subtitle: "None",
                route: .dateEditor
            )
        }
    }
}

#Preview {
    BarcodeTriggersSection()
}
