//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol CameraPermissionRequester: Sendable {
    func requestPermission() async -> PermissionStatus
}
