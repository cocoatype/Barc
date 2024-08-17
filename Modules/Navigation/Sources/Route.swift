//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public enum Route: Hashable {
    case barcodeDetails(Code)
    case dateEditor
    case locationEditor
}
