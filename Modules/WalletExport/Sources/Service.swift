//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import PassKit

protocol Service {
    func fetchPass(for code: Code) async throws -> PKPass
}
