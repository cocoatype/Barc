//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PhotosUI
import SwiftUI

import FactoryKit

import BarcAppShortcuts
import BarcBarcodes
import BarcBarcodeEdit
import BarcPersistence
import BarcReviewRequest

public struct PhotoLibraryButton<Label: View>: View {
    private let content: @Sendable () -> Label
    public init(
        @ViewBuilder content: @escaping @Sendable () -> Label
    ) {
        self.content = content
    }

    @State private var pickerResult = PickerResult.picking
    @State private var shouldDisplayAlert = false
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var barcodeRepository
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
                BarcodeEdit(value: value) {
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
            action: requestReview
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
