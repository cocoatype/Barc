//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ContactSection: View {
    var body: some View {
        Section(Strings.ContactSection.title) {
            MailPresentationCell()
            ReviewExternalURLCell()
            BlueskyExternalURLCell()
            FacebookExternalURLCell()
            ThreadsExternalURLCell()
            XExternalURLCell()
        }
    }
}

#Preview {
    List {
        ContactSection()
    }
}
