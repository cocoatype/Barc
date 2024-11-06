//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AVFoundation

struct CameraPermissionStatusMapper {
    func status(from authorizationStatus: AVAuthorizationStatus) -> PermissionStatus {
        switch authorizationStatus {
        case .notDetermined: .notDetermined
        case .restricted: .restricted
        case .denied: .denied
        case .authorized: .authorized
        @unknown default: .notDetermined
        }
    }
}
