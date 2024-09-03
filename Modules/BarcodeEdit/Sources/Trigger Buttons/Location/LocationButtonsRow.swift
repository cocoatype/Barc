//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct LocationButtonsRow: View {
    @Binding private var selectedLocation: Location?
    @Binding private var isLocationPickerPresented: Bool
    init(
        selectedLocation: Binding<Location?>,
        isLocationPickerPresented: Binding<Bool>
    ) {
        _selectedLocation = selectedLocation
        _isLocationPickerPresented = isLocationPickerPresented
    }

    var body: some View {
        HStack {
            CurrentLocationButton(selectedLocation: $selectedLocation)
            LocationPickerButton(inappropriateAmountOfErrors: $isLocationPickerPresented)
        }
        .alignmentGuide(.listRowSeparatorLeading) { dimension in
            dimension[.leading]
        }
    }
}

#Preview {
    LocationButtonsRow(
        selectedLocation: .constant(nil),
        isLocationPickerPresented: .constant(false)
    )
}
