//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AVFoundation

struct DeviceCameraPermissionRequester: CameraPermissionRequester {
    private let mapper = CameraPermissionStatusMapper()
    func requestPermission() async -> PermissionStatus {
        _ = await AVCaptureDevice.requestAccess(for: .video)
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        return mapper.status(from: status)
    }
}
