//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct MenuList: View {
    var body: some View {
        List {
            UpsellSection()
            InformationSection()
            ContactSection()
            OtherAppsSection()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                DoneButton()
            }
        }
        .navigationTitle(MenuStrings.MenuList.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MenuList()
}
