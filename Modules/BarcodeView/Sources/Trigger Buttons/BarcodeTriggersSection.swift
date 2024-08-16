import SwiftUI

struct BarcodeTriggersSection: View {
    var body: some View {
        Section {
            BarcodeTriggersButton(
                title: "Location",
                subtitle: "123 Fake Street",
                navigationValue: String?.none
            )
            BarcodeTriggersButton(
                title: "Date",
                subtitle: "None",
                navigationValue: String?.none
            )
        }
    }
}

#Preview {
    BarcodeTriggersSection()
}
