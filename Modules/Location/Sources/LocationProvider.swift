//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

public protocol LocationProvider {
    @MainActor var currentLocation: Location { get async throws }
}
