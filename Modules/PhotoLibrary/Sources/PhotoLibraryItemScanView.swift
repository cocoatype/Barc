//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import ImageReader
import PhotosUI
import SwiftUI

struct PhotoLibraryItemScanView: View {
    private let item: PhotosPickerItem
    @Binding private var pickerResult: PickerResult

    init(item: PhotosPickerItem, pickerResult: Binding<PickerResult>) {
        self.item = item
        _pickerResult = pickerResult
    }

    private let scanner = PhotoLibraryItemScanner()
    var body: some View {
        ProgressView()
            .task {
                do {
                    try await pickerResult = .editing(scanner.scan(item))
                } catch {
                    pickerResult = .error(error)
                }
            }
    }
}
