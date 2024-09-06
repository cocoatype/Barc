//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ContactSection: View {
    var body: some View {
        Section(MenuStrings.ContactSection.title) {
            MailRouteCell()
            ReviewRouteCell()
            ThreadsRouteCell()
            XRouteCell()
        }
    }
}

#Preview {
    ContactSection()
}
