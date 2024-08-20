//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import MapKit

struct LocationSearchCompletionMapper {
    func completion(from localSearchCompletion: MKLocalSearchCompletion) -> LocationSearchCompletion {
        return LocationSearchCompletion()
    }
}
