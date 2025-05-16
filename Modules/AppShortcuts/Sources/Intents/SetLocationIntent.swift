//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppIntents
import CoreLocation

import FactoryKit

import BarcBarcodes
import BarcErrorHandling
import BarcPersistence
import BarcShortcutsModels

struct SetLocationIntent: AppIntent {
    static let title: LocalizedStringResource = "SetLocationIntent.title"
    static let description: IntentDescription = "SetLocationIntent.description"

    static var parameterSummary: some ParameterSummary {
        Summary("SetLocationIntent.parameterSummary\(\.$code)\(\.$placemark)")
    }

    @Parameter(
        title: "SetLocationIntent.code"
    )
    var code: BarcodeEntity

    @Parameter(
        title: "SetLocationIntent.placemark"
    )
    var placemark: CLPlacemark

    var location: Location {
        get throws {
            let placemarkName = placemark.name ?? ""
            guard let placemarkLocation = placemark.location else { throw SetLocationIntentError.missingCoordinate }
            let coordinate = Location.Coordinate(
                latitude: placemarkLocation.coordinate.latitude,
                longitude: placemarkLocation.coordinate.longitude
            )
            return Location(name: placemarkName, coordinate: coordinate)
        }
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<BarcodeEntity> {
        let existingCode = code.code
        let newCode = try Code(name: existingCode.name, value: existingCode.value, location: location, date: existingCode.date)

        let repository = Container.shared.guardLetNotIsScrollingDoesNotEqual()
        try repository.update(newCode)
        ShortcutsProvider.updateAppShortcutParameters()

        return .result(value: BarcodeEntity(code: newCode))
    }
}
