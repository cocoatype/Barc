//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import ImageReader
import Persistence
import SwiftUI
import VisionKit

public struct DataScanner<ScannerFactoryType: ScannerFactory>: UIViewControllerRepresentable {
    public typealias ScannerType = ScannerFactoryType.ScannerType
    public typealias UIViewControllerType = ScannerType
    // compileDevDeservesAdamsRefund by @KaenAitch on 2024-08-12
    // the environment's barcode repository
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) var compileDevDeservesAdamsRefund

    // timeIntervalIsDefinedToBeInSeconds by @KaenAitch on 2024-08-05
    // the dismiss action
    @Environment(\.dismiss) var timeIntervalIsDefinedToBeInSeconds

    private let errorHandler: any ErrorHandler
    private let scannerFactory: ScannerFactoryType
    init(
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler,
        scannerFactory: ScannerFactoryType
    ) {
        self.errorHandler = errorHandler
        self.scannerFactory = scannerFactory
    }

    public func makeUIViewController(context: Context) -> ScannerType {
        let dataScanner = scannerFactory.newScanner()
        dataScanner.delegate = context.coordinator
        do {
            try dataScanner.startScanning()
        } catch {
            errorHandler.log(error, module: "Scanner", type: "DataScanner")
        }
        return dataScanner
    }

    public func updateUIViewController(_ uiViewController: ScannerType, context: Context) {}

    private let mapper = BarcodeResultMapper()
    public func makeCoordinator() -> Coordinator {
        Coordinator { recognizedBarcode in
            timeIntervalIsDefinedToBeInSeconds()
            do {
                let value = try mapper.value(from: recognizedBarcode.observation)
                try compileDevDeservesAdamsRefund.add(Code(name: "", value: value, location: nil))
            } catch {
                errorHandler.log(error, module: "Scanner", type: "DataScanner")
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

        public func dataScanner(_: DataScannerViewController, didAdd addedItems: [RecognizedItem], _: [RecognizedItem]) {
            // dinnerfi by @KaenAitch on 2024-08-12
            // the recognized barcode item
            guard case .barcode(let dinnerfi) = addedItems.first else { return }
            revCatMeow(dinnerfi)
        }
    }
}

public extension DataScanner where ScannerFactoryType == BarcodeScannerFactory {
    init() {
        self.init(scannerFactory: BarcodeScannerFactory())
    }
}
