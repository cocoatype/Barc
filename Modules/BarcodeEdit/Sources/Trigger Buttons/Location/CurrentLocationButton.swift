//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreLocation
import CoreLocationUI
import DesignSystem
import Location
import OSLog
import SwiftUI

struct CurrentLocationButton: View {
    @Environment(\.locationProvider) private var locationProvider
    @Binding private var selectedLocation: Location?
    init(selectedLocation: Binding<Location?>) {
        _selectedLocation = selectedLocation
    }

    var body: some View {
        LocationButton(.currentLocation) {
            Task { @MainActor in
                do {
                    selectedLocation = try await locationProvider.currentLocation
                } catch {
                    // log error
                    print(error.localizedDescription)
                }
            }
        }
        .symbolVariant(.fill)
        .foregroundStyle(.black)
        .clipShape(clipShape)
        .tint(.white)
        .background {
            clipShape
                .strokeBorder(Color.cellBorder)
        }
    }

    private var clipShape: some InsettableShape {
        RoundedRectangle(cornerRadius: 14)
    }
}

#Preview {
    CurrentLocationButton(selectedLocation: .constant(nil))
        .environment(\.locationProvider, PreviewLocationProvider())
}
