//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppShortcuts
import Barcodes
import BarcodeEdit
import ErrorHandling
import Persistence
import PhotosUI
import ReviewRequest
import SwiftUI

public struct PhotoLibraryButton: View {
    private let barcodeRepository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    public init(
        barcodeRepository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.barcodeRepository = barcodeRepository
        self.errorHandler = errorHandler
    }

    @State private var pickerResult: PickerResult = .picking
    public var body: some View {
        PhotosPicker(selection: $pickerResult.item) {
            Asset.photoLibraryToolbarButton.swiftUIImage
        }.sheet(item: $pickerResult.item) { item in
            PhotoLibraryItemScanView(item: item, pickerResult: $pickerResult)
        }.sheet(item: $pickerResult.codeValue) { value in
            BarcodeEdit(value: value, errorHandler: errorHandler) {
                handleEdit($0)
            }
        }
        .errorAlert(for: $pickerResult)
    }

    @Environment(\.requestReview) private var requestReview
    private var requester: ReviewRequester {
        ReviewRequester(
            action: requestReview,
            repository: barcodeRepository
        )
    }

    @Environment(\.dismiss) private var dismiss
    private func handleEdit(_ code: Code?) {
        guard let code else { return dismiss() }

        do {
            try barcodeRepository.add(code)
            ShortcutsProvider.updateAppShortcutParameters()
            dismiss()
            try requester.requestReviewIfNeeded()
        } catch {
            pickerResult = .error(error)
        }
    }
}

extension PhotosPickerItem: @retroactive Identifiable {
    public var id: Int { hashValue }
}
