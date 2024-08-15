import SwiftUI

struct BarcodeTriggersSection: View {
    var body: some View {
        VStack(spacing: 0) {
            BarcodeTriggersButton(title: "Location", subtitle: "123 Fake Street") {}
            BarcodeTriggersSeparator()
            BarcodeTriggersButton(title: "Date", subtitle: "None") {}

        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    BarcodeTriggersSection()
}
