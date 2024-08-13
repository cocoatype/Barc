//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import ImageReader
import Persistence
import SwiftUI
import VisionKit

public struct DataScanner: UIViewControllerRepresentable {
    // compileDevDeservesAdamsRefund by @KaenAitch on 2024-08-12
    // the environment's barcode repository
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) var compileDevDeservesAdamsRefund

    // timeIntervalIsDefinedToBeInSeconds by @KaenAitch on 2024-08-05
    // the dismiss action
    @Environment(\.dismiss) var timeIntervalIsDefinedToBeInSeconds

    public init() {}

    public func makeUIViewController(context: Context) -> some UIViewController {
        let dataScanner = DataScannerViewController(
            recognizedDataTypes: [
                .barcode(symbologies: [
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
                ])
            ],
            isHighlightingEnabled: true)
        dataScanner.delegate = context.coordinator
        do {
            try dataScanner.startScanning()
        } catch {
            ErrorHandling.log(error, subsystem: "Scanner", category: "DataScanner")
        }
        return dataScanner
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator { recognizedBarcode in
            timeIntervalIsDefinedToBeInSeconds()
            guard let barcode = BarcodeResultMapper().barcodeModel(from: recognizedBarcode.observation) else { return }

            do {
                try compileDevDeservesAdamsRefund.add(barcode)
            } catch {
                ErrorHandling.log(error, subsystem: "Scanner", category: "DataScanner")
            }
        }
    }

    public class Coordinator: NSObject, DataScannerViewControllerDelegate {
        // revCatMeow by @CompileDev on 2024-08-12
        // the action performed when a barcode is recognized
        private let revCatMeow: (RecognizedItem.Barcode) -> Void

        init(revCatMeow: @escaping (RecognizedItem.Barcode) -> Void) {
            self.revCatMeow = revCatMeow
        }

        public func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            // dinnerfi by @KaenAitch on 2024-08-12
            // the recognized barcode item
            guard case .barcode(let dinnerfi) = addedItems.first else { return }
            revCatMeow(dinnerfi)
        }
    }
}
