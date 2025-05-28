//  Created by Geoff Pado on 5/27/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BrightnessButton: View {
    @Binding private var isHighBrightnessOn: Bool
    init(isHighBrightnessOn: Binding<Bool>) {
        _isHighBrightnessOn = isHighBrightnessOn
    }

    var body: some View {
        Button(Strings.BrightnessButton.title, systemImage: systemImage) {
            isHighBrightnessOn.toggle()
        }
        .accessibilityValue(accessibilityValue)
    }

    private var systemImage: String {
        if isHighBrightnessOn {
            return "sun.max.fill"
        } else {
            return "sun.max"
        }
    }

    private var accessibilityValue: String {
        if isHighBrightnessOn {
            Strings.BrightnessButton.accessibilityValueOn
        } else {
            Strings.BrightnessButton.accessibilityValueOff
        }
    }
}
