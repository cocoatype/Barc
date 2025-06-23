//  Created by Geoff Pado on 6/22/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppIntents
import Contacts
import CoreLocation
import MapKit

import BarcBarcodes
import BarcLocation
import BarcShortcutsModels

struct GetBarcodeLocationIntent: AppIntent {
    static let title: LocalizedStringResource = "GetBarcodeLocationIntent.title"

    static let description: IntentDescription = "GetBarcodeLocationIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("GetBarcodeLocationIntent.parameterSummary\(\.$code)")
    }

    @Parameter(
        title: "GetBarcodeLocationIntent.code"
    )
    var code: BarcodeEntity

    func perform() async throws -> some IntentResult & ReturnsValue<CLPlacemark?> {
        guard let location = code.code.location else {
            return .result(value: nil)
        }

        let placemark = BarcodePlacemark(location: location)
        return .result(value: CLPlacemark(placemark: placemark))
    }

    @objc(BarcBarcodePlacemark) private class BarcodePlacemark: CLPlacemark, @unchecked Sendable {
        private let codeLocation: Location
        init(location: Location) {
            self.codeLocation = location
            let coordinate = CLLocationCoordinate2D(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            )
            let superPlacemark = MKPlacemark(coordinate: coordinate)
            super.init(placemark: superPlacemark)
        }

        override var name: String? { codeLocation.name }
        override var thoroughfare: String? { codeLocation.thoroughfare }
        override var locality: String? { codeLocation.city }
        override var administrativeArea: String? { codeLocation.state }
        override var postalCode: String? { codeLocation.postalCode }
        override var country: String? { codeLocation.country }

        override init(placemark: CLPlacemark) {
            let mapper = PlacemarkMapper()
            do {
                codeLocation = try mapper.location(from: placemark)
                super.init(placemark: placemark)
            } catch {
                fatalError(String(describing: error))
            }
        }

        override class var supportsSecureCoding: Bool { return true }

        @available(*, unavailable)
        required init(coder: NSCoder) {
            let typeName = NSStringFromClass(type(of: self))
            fatalError("\(typeName) does not implement init(coder:)")
        }
    }
}


