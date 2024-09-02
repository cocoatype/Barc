//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Navigation
import SwiftUI

struct BarcodeTriggersButton: View {
    private let title: String
    private let subtitle: String
    @Binding private var isEditorShowing: Bool
    init(title: String, subtitle: String, isEditorShowing: Binding<Bool>) {
        self.title = title
        self.subtitle = subtitle
        _isEditorShowing = isEditorShowing
    }

    var body: some View {
        Button {
            isEditorShowing = true
        } label: {
            HStack {
                Toggle(isOn: $isEditorShowing) {
                    VStack(alignment: .leading) {
                        BarcodeTriggersButtonPrimaryText(title)
                        BarcodeTriggersButtonSecondaryText(subtitle)
                    }
                }
            }
        }
    }
}

import Barcodes
#Preview {
    BarcodeTriggersButton(title: "Location", subtitle: "None", isEditorShowing: .constant(false))
}
