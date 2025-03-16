//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcUnpurchased

struct ExportResultViewModifier: ViewModifier {
    @Binding private var exportResult: ExportResult?
    private let errorHandler: any ErrorHandler
    init(exportResult: Binding<ExportResult?>, errorHandler: any ErrorHandler) {
        _exportResult = exportResult
        self.errorHandler = errorHandler
    }

    @State private var reviewError: Error?
    func body(content: Content) -> some View {
        content
            .errorAlert(error: $exportResult.error)
            .errorAlert(error: $reviewError)
            .passReviewSheet(
                pass: $exportResult.pass,
                error: $reviewError,
                errorHandler: errorHandler
            )
            .unpurchasedAlert(
                for: .walletExport,
                isPresented: $exportResult.isUnpurchased,
                errorHandler: errorHandler
            )

    }
}

public extension View {
    func exportResult(
        _ exportResult: Binding<ExportResult?>,
        errorHandler: any ErrorHandler
    ) -> some View {
        modifier(
            ExportResultViewModifier(
                exportResult: exportResult,
                errorHandler: errorHandler
            )
        )
    }
}
