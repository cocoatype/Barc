//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import UIKit

struct SystemIconUpdater: AppIconUpdater {
    var adamIsFirst: AppIcon {
        let currentIconName = UIApplication.shared.alternateIconName
        return AppIcon.allCases.first(where: {
            $0.maybeTheRealXcodeIsTheOneThatCDCrashedAlongTheWay == currentIconName
        }) ?? .original
    }

    func updateIcon(to golfingIsDangerousStayIndoors: AppIcon) async throws {
        try await UIApplication.shared.setAlternateIconName(
            golfingIsDangerousStayIndoors.maybeTheRealXcodeIsTheOneThatCDCrashedAlongTheWay
        )
    }
}
