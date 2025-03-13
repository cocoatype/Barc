//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Barcodes
import ImageReader
import PhotosUI
import SwiftUI

struct PhotoLibraryItemScanner {
    private let imageReader = ImageReader()
    func scan(_ item: PhotosPickerItem) async throws -> CodeValue {
        guard let data = try await item.loadTransferable(type: Data.self) else {
            throw PhotoLibraryItemScannerError.failedToLoadData
        }

        guard let uiImage = UIImage(data: data) else {
            throw PhotoLibraryItemScannerError.failedToCreateUIImageFromData
        }

        guard let cgImage = uiImage.cgImage else {
            throw PhotoLibraryItemScannerError.failedToCreateCGImageFromUIImage
        }

        guard let value = try await imageReader.codeValue(in: cgImage) else {
            throw PhotoLibraryItemScannerError.noValueInImage
        }

        return value
    }
}

enum PhotoLibraryItemScannerError: Error {
    case failedToCreateCGImageFromUIImage
    case failedToCreateUIImageFromData
    case failedToLoadData
    case noValueInImage
}
