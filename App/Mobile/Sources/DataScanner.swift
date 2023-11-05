//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI
import VisionKit

struct DataScanner: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.barcode(symbologies: [
            .aztec,
            .codabar,
            .code39,
            .code39Checksum,
            .code39FullASCII,
            .code39FullASCIIChecksum,
            .code93,
            .code93i,
            .code128,
            .dataMatrix,
            .ean8,
            .ean13,
            .gs1DataBar,
            .gs1DataBarExpanded,
            .gs1DataBarLimited,
            .i2of5,
            .i2of5Checksum,
            .itf14,
            .microPDF417,
            .microQR,
            .msiPlessey,
            .pdf417,
            .qr,
            .upce
        ])],
        isHighlightingEnabled: true)
        dataScanner.delegate = context.coordinator
        try! dataScanner.startScanning()
        return dataScanner
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator() }

    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            dump(allItems)
        }
    }
}
