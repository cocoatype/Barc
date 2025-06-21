//  Created by Claude on 6/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing
import CoreLocation
import MapKit
import BarcBarcodes

@testable import BarcLocation

struct PlacemarkMapperTests {
    let mapper = PlacemarkMapper()

    @Test("PlacemarkMapper creates location from valid placemark")
    func createsLocationFromValidPlacemark() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let placemark = MKPlacemark(coordinate: coordinate)

        // Use setValue to set the name since MKPlacemark name is readonly
        let mockPlacemark = MockPlacemark(placemark: placemark, mockName: "San Francisco")

        let location = try mapper.location(from: mockPlacemark)

        #expect(location.name == "San Francisco")
        #expect(location.coordinate.latitude == 37.7749)
        #expect(location.coordinate.longitude == -122.4194)
    }

    @Test("PlacemarkMapper handles placemark with nil name")
    func handlesPlacemarkWithNilName() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mockPlacemark = MockPlacemark(placemark: placemark, mockName: nil)

        let location = try mapper.location(from: mockPlacemark)

        #expect(location.name == "")
        #expect(location.coordinate.latitude == 40.7128)
        #expect(location.coordinate.longitude == -74.0060)
    }

    @Test("PlacemarkMapper throws error when placemark has no location")
    func throwsErrorWhenPlacemarkHasNoLocation() {
        let mockPlacemark = MockPlacemarkWithoutLocation(mockName: "Test Location")

        #expect(throws: PlacemarkMapperError.missingCoordinate) {
            try _ = mapper.location(from: mockPlacemark)
        }
    }

    @Test("PlacemarkMapper handles empty string name")
    func handlesEmptyStringName() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mockPlacemark = MockPlacemark(placemark: placemark, mockName: "")

        let location = try mapper.location(from: mockPlacemark)

        #expect(location.name == "")
        #expect(location.coordinate.latitude == 51.5074)
        #expect(location.coordinate.longitude == -0.1278)
    }

    @Test("PlacemarkMapper handles extreme coordinate values")
    func handlesExtremeCoordinateValues() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 90.0, longitude: 180.0)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mockPlacemark = MockPlacemark(placemark: placemark, mockName: "North Pole")

        let location = try mapper.location(from: mockPlacemark)

        #expect(location.name == "North Pole")
        #expect(location.coordinate.latitude == 90.0)
        #expect(location.coordinate.longitude == 180.0)
    }

    @Test("PlacemarkMapper handles negative coordinates")
    func handlesNegativeCoordinates() throws {
        let coordinate = CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093)
        let placemark = MKPlacemark(coordinate: coordinate)
        let mockPlacemark = MockPlacemark(placemark: placemark, mockName: "Sydney")

        let location = try mapper.location(from: mockPlacemark)

        #expect(location.name == "Sydney")
        #expect(location.coordinate.latitude == -33.8688)
        #expect(location.coordinate.longitude == 151.2093)
    }
}

// MARK: - Mock Objects

private class MockPlacemark: CLPlacemark, @unchecked Sendable {
    private let mockName: String?
    private let mockLocation: CLLocation?

    init(placemark: MKPlacemark, mockName: String?, mockLocation: CLLocation? = nil) {
        self.mockName = mockName
        self.mockLocation = mockLocation ?? CLLocation(latitude: placemark.coordinate.latitude, longitude: placemark.coordinate.longitude)
        super.init(placemark: placemark)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var name: String? {
        return mockName
    }

    override var location: CLLocation? {
        return mockLocation
    }
}

private class MockPlacemarkWithoutLocation: CLPlacemark, @unchecked Sendable {
    private let mockName: String?

    init(mockName: String?) {
        self.mockName = mockName
        // Create with a valid base but override location to nil
        let basePlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        super.init(placemark: basePlacemark)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var name: String? {
        return mockName
    }

    override var location: CLLocation? {
        return nil  // Always return nil to trigger the error
    }
}
