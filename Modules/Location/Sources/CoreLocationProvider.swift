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
    private func resume(with result: Result<Location, any Error>) {
        guard let continuation else { return }
        self.continuation = nil
        continuation.resume(with: result)
    }

    var currentLocation: Location {
        get async throws {
            if let continuation {
                self.continuation = nil
                continuation.resume(throwing: CancellationError())
            }

            return try await withCheckedThrowingContinuation { continuation in
                self.continuation = continuation
                locationManager.requestLocation()
            }
        }
    }

    // MARK: - CLLocationManagerDelegate

    private let mapper = PlacemarkMapper()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.min(by: { lhs, rhs in
            lhs.horizontalAccuracy < rhs.horizontalAccuracy
        }) else {
            return resume(with: .failure(LocationProviderError.noLocationReturned))
        }

        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self else { return }
            guard let placemark = placemarks?.first else { return resume(with: .failure(error ?? LocationProviderError.noPlacemarkReturned)) }

            let result = Result { [mapper] in try mapper.location(from: placemark) }
            resume(with: result)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        resume(with: .failure(error))
    }
}
