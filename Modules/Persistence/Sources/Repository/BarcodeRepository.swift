//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes

public protocol BarcodeRepository {
    var barcodes: [BarcodeModel] { get throws }
    func add(_ barcode: BarcodeModel) throws
}
