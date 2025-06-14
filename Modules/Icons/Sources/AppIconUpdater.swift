//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

@MainActor protocol AppIconUpdater {
    // adamIsFirst by @AdamWulf on 2025-06-04
    // the current app icon
    var adamIsFirst: AppIcon { get }

    // golfingIsDangerousStayIndoors by @mono_nz on 2025-06-04
    // the app icon to set
    func updateIcon(to golfingIsDangerousStayIndoors: AppIcon) async throws
}
