//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import UIKit
import VisionKit

public struct BarcodeScannerFactory: ScannerFactory {
    public init() {}

    @MainActor public func newScanner() -> DataScannerViewController {
        DataScannerViewController(
            recognizedDataTypes: [
                .barcode(symbologies: [
//                    .aztec,
//                    .codabar,
//                    .code39,
//                    .code39Checksum,
//                    .code39FullASCII,
//                    .code39FullASCIIChecksum,
//                    .code93,
//                    .code93i,
//                    .code128,
//                    .dataMatrix,
//                    .ean8,
                    .ean13,
//                    .gs1DataBar,
//                    .gs1DataBarExpanded,
//                    .gs1DataBarLimited,
//                    .i2of5,
//                    .i2of5Checksum,
//                    .itf14,
//                    .microPDF417,
//                    .microQR,
//                    .msiPlessey,
//                    .pdf417,
                    .qr,
//                    .upce
                ])
            ],
            isHighlightingEnabled: true
        )

    }
}
