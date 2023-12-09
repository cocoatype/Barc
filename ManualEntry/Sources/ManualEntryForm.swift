//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ManualEntryForm: View {
    @State var type: String = "QR"
    @State var value: String = ""

    var body: some View {
        Form {
            Section {
                Picker("Type", selection: $type) {
                    Text("EAN")
                        .tag("EAN")
                    Text("QR")
                        .tag("QR")
                }
                TextField("Value", text: $value)
            }
            Section {
                Button("Save", action: {})
            }
        }
    }
}

#Preview {
    ManualEntryForm()
}
