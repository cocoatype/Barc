//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes
import MapKit

struct MapLocationSearcher: LocationSearcher {
    func locations(for string: String) async throws -> [Location] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = string
        let search = MKLocalSearch(request: request)

        let response = try await search.start()
        return response.mapItems.map(mapper.location(from:))
    }

    private let mapper = MapItemMapper()
}
