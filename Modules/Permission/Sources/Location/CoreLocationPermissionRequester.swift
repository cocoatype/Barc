//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreLocation

class CoreLocationPermissionRequester: NSObject, LocationPermissionRequester, CLLocationManagerDelegate {
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
    }

    private var continuation: CheckedContinuation<PermissionStatus, Never>?
    func requestPermission() async -> PermissionStatus {
        return await withCheckedContinuation { continuation in
            self.continuation = continuation
            manager.requestWhenInUseAuthorization()
        }
    }

    // MARK: CLLocationManagerDelegate

    private let mapper = LocationPermissionStatusMapper()
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        continuation?.resume(returning: mapper.status(from: manager.authorizationStatus))
    }
}
