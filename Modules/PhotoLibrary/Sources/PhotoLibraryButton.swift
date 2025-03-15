//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PhotosUI
import SwiftUI

import BarcAppShortcuts
import BarcBarcodes
import BarcBarcodeEdit
import BarcErrorHandling
import BarcPersistence
import BarcReviewRequest

public struct PhotoLibraryButton<Label: View>: View {
    private let barcodeRepository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    private let content: @Sendable () -> Label
    public init(
        barcodeRepository: any BarcodeRepository,
        errorHandler: any ErrorHandler,
        @ViewBuilder content: @escaping @Sendable () -> Label
    ) {
        self.barcodeRepository = barcodeRepository
        self.errorHandler = errorHandler
        self.content = content
    }

    @State private var pickerResult = PickerResult.picking
    @State private var shouldDisplayAlert = false
    public var body: some View {
        PhotosPicker(selection: $pickerResult.item) {
            content()
        }.sheet(item: $pickerResult.item, onDismiss: updateAlertState) { item in
            PhotoLibraryItemScanView(item: item, pickerResult: $pickerResult)
        }.sheet(item: $pickerResult.codeValue) {
            updateAlertState()
            handleEdit(nil)
        } content: { value in
            NavigationStack {
                BarcodeEdit(value: value, errorHandler: errorHandler) {
                    handleEdit($0)
                }
            }
        }
        .errorAlert(for: $pickerResult, shouldDisplayAlert: $shouldDisplayAlert)
    }

    private func updateAlertState() {
        shouldDisplayAlert = (pickerResult.error != nil)
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
        guard case .editing = pickerResult else { return }
        guard let code else {
            dismiss()
            pickerResult = .picking
            return
        }

        do {
            try barcodeRepository.add(code)
            ShortcutsProvider.updateAppShortcutParameters()
            dismiss()
            pickerResult = .picking
            try requester.requestReviewIfNeeded()
        } catch {
            pickerResult = .error(error)
        }
    }
}

extension PhotosPickerItem: @retroactive Identifiable {
    public var id: Int { hashValue }
}
