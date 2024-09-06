//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct KineoAppCell: View {
    var body: some View {
        RouteCell(
            title: MenuStrings.KineoAppCell.title,
            subtitle: MenuStrings.KineoAppCell.subtitle,
            route: .privacy
        )
    }
}

#Preview {
    KineoAppCell()
}
