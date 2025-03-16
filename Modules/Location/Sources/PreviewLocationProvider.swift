//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

public struct PreviewLocationProvider: LocationProvider {
    public init() {}

    public var currentLocation: Location {
        Location(name: "Apple Park", coordinate: .init())
    }
}
