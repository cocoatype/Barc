////  Created by Geoff Pado on 3/11/25.
////  Copyright © 2025 Cocoatype, LLC. All rights reserved.
//
import ErrorHandling
import Persistence
import PhotosUI
import StoreKit
import SwiftUI
//
public struct PhotoLibraryView: View {
//    @State private var pickerResult = PickerResult.picking
//
    private let barcodeRepository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        barcodeRepository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.barcodeRepository = barcodeRepository
        self.errorHandler = errorHandler
    }
//
    public var body: some View {
//        Group {
//            switch pickerResult {
//            case .loading:
                Color.red
//                    .task {
//                        _ = try? await Task.sleep(nanoseconds: NSEC_PER_SEC)
//                        pickerResult = .picking
//                    }
//            case .picking:
////                PhotoLibraryResultScanView(/*result: result*/)
//                PhotoPicker(pickerResult: $pickerResult)
//            case .scanning(let result):
//                PhotoLibraryResultScanView(/*result: result*/)
//            case .editing(let codeValue):
//                PhotoLibraryEditView(
//                    codeValue: codeValue,
//                    pickerResult: $pickerResult,
//                    barcodeRepository: barcodeRepository,
//                    errorHandler: errorHandler
//                )
//            case .error(let error):
//                PhotoLibraryErrorView(error: error)
//            }
//        }
    }
}
