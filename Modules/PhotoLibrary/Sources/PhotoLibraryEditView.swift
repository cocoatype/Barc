//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcAppShortcuts
import BarcBarcodes
import BarcBarcodeEdit
import BarcErrorHandling
import BarcPersistence
import BarcReviewRequest

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
        BarcodeEdit(value: codeValue) { resultCode in
            handleEdit(resultCode)
        }
    }

    @Environment(\.requestReview) private var requestReview
    private var requester: ReviewRequester {
        ReviewRequester(
            action: requestReview
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
