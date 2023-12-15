//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Library
import ManualEntry
import SwiftUI

struct RootView: View {
    @State var isShowingManualEntry = false
    @State var refreshID = UUID()

    var body: some View {
        NavigationStack {
            Library()
                .id(refreshID)
                .toolbar {
                    ToolbarItem {
                        Button {
                            isShowingManualEntry = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isShowingManualEntry) {
                    refreshID = UUID()
                } content: {
                    ManualEntry()
                }
        }
    }
}

#Preview {
    RootView()
}
