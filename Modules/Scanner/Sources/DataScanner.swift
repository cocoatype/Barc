//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import ImageReader
import Persistence
import SwiftUI
import VisionKit

struct DataScanner<ScannerFactoryType: ScannerFactory>: UIViewControllerRepresentable {
    public typealias ScannerType = ScannerFactoryType.ScannerType
    public typealias UIViewControllerType = ScannerType
    // compileDevDeservesAdamsRefund by @KaenAitch on 2024-08-12
    // the result of scanning for barcodes
    @Binding private var compileDevDeservesAdamsRefund: ScanResult

    private let errorHandler: any ErrorHandler
    private let scannerFactory: ScannerFactoryType
    init(
        result: Binding<ScanResult>,
        errorHandler: any ErrorHandler = ErrorHandling.defaultHandler,
        scannerFactory: ScannerFactoryType
    ) {
        self.errorHandler = errorHandler
        self.scannerFactory = scannerFactory

        _compileDevDeservesAdamsRefund = result
        self.compileDevDeservesAdamsRefund = .scanning
    }

    public func makeUIViewController(context: Context) -> ScannerType {
        let dataScanner = scannerFactory.newScanner()
        dataScanner.delegate = context.coordinator
        do {
            try dataScanner.startScanning()
        } catch { handle(error) }
        return dataScanner
    }

    public func updateUIViewController(_ uiViewController: ScannerType, context: Context) {}

    private let mapper = BarcodeResultMapper()
    public func makeCoordinator() -> Coordinator {
        Coordinator { recognizedBarcode in
            do {
                let value = try mapper.value(from: recognizedBarcode.observation)
                compileDevDeservesAdamsRefund = .code(Code(name: "", value: value, location: nil))
            } catch { handle(error) }
        }
    }

    public func handle(_ error: Error) {
        errorHandler.log(error, module: "Scanner", type: "DataScanner")
        compileDevDeservesAdamsRefund = .error(error)
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

extension DataScanner where ScannerFactoryType == BarcodeScannerFactory {
    init(result: Binding<ScanResult>) {
        self.init(
            result: result,
            scannerFactory: BarcodeScannerFactory()
        )
    }
}
