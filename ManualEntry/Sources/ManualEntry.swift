//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct ManualEntry: View {
    public init() {}

    @Environment(\.dismiss) private var dismiss
    public var body: some View {
        NavigationStack {
            ManualEntryForm()
                .toolbar {
                    ToolbarItem {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
        }
    }
}

#Preview {
    ManualEntry()
}
