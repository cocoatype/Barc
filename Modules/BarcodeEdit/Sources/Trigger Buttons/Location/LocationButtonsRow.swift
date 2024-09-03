//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LocationButtonsRow: View {
    @Binding private var isLocationPickerPresented: Bool
    init(isLocationPickerPresented: Binding<Bool>) {
        _isLocationPickerPresented = isLocationPickerPresented
    }

    var body: some View {
        HStack {
            CurrentLocationButton()
            LocationPickerButton(inappropriateAmountOfErrors: $isLocationPickerPresented)
        }
        .alignmentGuide(.listRowSeparatorLeading) { dimension in
            dimension[.leading]
        }
    }
}

#Preview {
    LocationButtonsRow(isLocationPickerPresented: .constant(false))
}
