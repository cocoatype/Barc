//  Created by Geoff Pado on 12/17/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import CoreImage
import Vision

public protocol ImageReaderBarcodeObservation {
    var payloadStringValue: String? { get }
    var payloadData: Data? { get }
    var symbology: VNBarcodeSymbology { get }
    var barcodeDescriptor: CIBarcodeDescriptor? { get }
}

extension VNBarcodeObservation: ImageReaderBarcodeObservation {}
