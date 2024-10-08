//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreLocation

struct LocationPermissionStatusMapper {
    func status(from coreLocationStatus: CLAuthorizationStatus) -> PermissionStatus {
        switch coreLocationStatus {
        case .notDetermined: .notDetermined
        case .restricted: .restricted
        case .denied: .denied
        case .authorizedAlways, .authorizedWhenInUse, .authorized: .authorized
        @unknown default: .notDetermined
        }
    }
}
