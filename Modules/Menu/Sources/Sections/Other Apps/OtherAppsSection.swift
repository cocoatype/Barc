//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct OtherAppsSection: View {
    var body: some View {
        Section(Strings.OtherAppsSection.title) {
            HighlighterAppCell()
            KineoAppCell()
            DebigulatorAppCell()
        }
    }
}

#Preview {
    OtherAppsSection()
}
