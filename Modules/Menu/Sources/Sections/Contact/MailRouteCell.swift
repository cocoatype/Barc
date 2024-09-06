//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct MailRouteCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.MailRouteCell.title,
            subtitle: MenuStrings.MailRouteCell.subtitle,
            route: .privacy
        )
    }
}

#Preview {
    MailRouteCell()
}
