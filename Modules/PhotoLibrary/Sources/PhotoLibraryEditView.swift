//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import AppShortcuts
import Barcodes
import BarcodeEdit
import ErrorHandling
import Persistence
import ReviewRequest
import SwiftUI

struct PhotoLibraryEditView: View {
    @Binding private var pickerResult: PickerResult

    private let codeValue: CodeValue
    private let barcodeRepository: any BarcodeRepository
    private let errorHandler: any ErrorHandler

    init(
        codeValue: CodeValue,
        pickerResult: Binding<PickerResult>,
        barcodeRepository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.codeValue = codeValue
        _pickerResult = pickerResult
        self.barcodeRepository = barcodeRepository
        self.errorHandler = errorHandler
    }

    var body: some View {
        BarcodeEdit(value: codeValue, errorHandler: errorHandler) { resultCode in
            handleEdit(resultCode)
        }
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
