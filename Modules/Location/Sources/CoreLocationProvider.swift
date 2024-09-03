//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreLocation

class CoreLocationProvider: NSObject, LocationProvider, CLLocationManagerDelegate {
    private let geocoder = CLGeocoder()
    private var locationManager: CLLocationManager

    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }

    private var continuation: CheckedContinuation<Location, any Error>?
    var currentLocation: Location {
        get async throws {
            return try await withCheckedThrowingContinuation { continuation in
                self.continuation = continuation
                locationManager.requestLocation()
            }
        }
    }

    // MARK: - CLLocationManagerDelegate

    private let mapper = PlacemarkMapper()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let continuation else { return }
        guard let location = locations.min(by: { lhs, rhs in
            lhs.horizontalAccuracy < rhs.horizontalAccuracy
        }) else {
            return continuation.resume(throwing: LocationProviderError.noLocationReturned)
        }

        geocoder.reverseGeocodeLocation(location) { [mapper] placemarks, error in
            guard let placemark = placemarks?.first else { return continuation.resume(throwing: error ?? LocationProviderError.noPlacemarkReturned) }

            let result = Result { try mapper.location(from: placemark) }
            continuation.resume(with: result)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        guard let continuation else { return }
        continuation.resume(throwing: error)
    }
}
