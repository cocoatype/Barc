//  Created by Claude on 6/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing
import Foundation

@testable import BarcLocation

struct PlacemarkMapperErrorTests {
    @Test("PlacemarkMapperError.missingCoordinate has correct localized string resource")
    func missingCoordinateHasCorrectLocalizedStringResource() {
        let error = PlacemarkMapperError.missingCoordinate
        let resource = error.localizedStringResource

        #expect(resource == StringResources.PlacemarkMapperError.missingCoordinate)
    }

    @Test("PlacemarkMapperError equality works correctly")
    func equalityWorksCorrectly() {
        let error1 = PlacemarkMapperError.missingCoordinate
        let error2 = PlacemarkMapperError.missingCoordinate

        #expect(error1 == error2)
    }
}
