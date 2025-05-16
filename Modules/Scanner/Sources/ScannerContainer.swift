//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import StoreKit
import SwiftUI

import FactoryKit

import BarcAppShortcuts
import BarcBarcodes
import BarcBarcodeEdit
import BarcPersistence
import BarcReviewRequest

public struct ScannerContainer: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.requestReview) private var requestReview

    @State private var scanResult = ScanResult.scanning

    public init() {}

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
            action: requestReview
        )
    }

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    private func handleEdit(_ code: Code?) {
        guard let code else { return dismiss() }

        do {
            try repository.add(code)
            ShortcutsProvider.updateAppShortcutParameters()
            dismiss()
            try requester.requestReviewIfNeeded()
        } catch {
            scanResult = .error(error)
        }
    }
}
