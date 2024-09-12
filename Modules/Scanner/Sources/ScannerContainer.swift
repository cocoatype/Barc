//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeEdit
import ErrorHandling
import ReviewRequest
import StoreKit
import SwiftUI

#if compiler(<6.0)
@MainActor
#endif
public struct ScannerContainer: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @Environment(\.requestReview) private var requestReview

    @State private var scanResult = ScanResult.scanning

    private let errorHandler: any ErrorHandler

    public init() {
        self.init(errorHandler: ErrorHandling.defaultHandler)
    }

    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    public var body: some View {
        NavigationStack {
            if case .codeValue(let codeValue) = scanResult {
                BarcodeEdit(value: codeValue) { resultCode in
                    handleEdit(resultCode)
                }
            } else {
                DataScanner(result: $scanResult)
                    .ignoresSafeArea()
                    .overlay(NavigationBarScrim())
                    .toolbar { ScannerContainerDismissButton() }
            }
        }
        .errorAlert(for: $scanResult)
    }

    private var requester: ReviewRequester {
        ReviewRequester(
            action: requestReview,
            repository: repository
        )
    }

    private func handleEdit(_ code: Code?) {
        guard let code else { return dismiss() }

        do {
            try repository.add(code)
            dismiss()
            try requester.requestReviewIfNeeded()
        } catch {
            scanResult = .error(error)
        }
    }
}
