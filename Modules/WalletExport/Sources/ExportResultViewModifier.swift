//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcErrorHandling
import BarcLogging
import BarcUnpurchased

struct ExportResultViewModifier: ViewModifier {
    @Binding private var exportResult: ExportResult?
    private let errorHandler: any ErrorHandler
    private let logger: any Logger
    init(
        exportResult: Binding<ExportResult?>,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) {
        _exportResult = exportResult
        self.errorHandler = errorHandler
        self.logger = logger
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
                errorHandler: errorHandler,
                logger: logger
            )

    }
}

public extension View {
    func exportResult(
        _ exportResult: Binding<ExportResult?>,
        errorHandler: any ErrorHandler,
        logger: any Logger
    ) -> some View {
        modifier(
            ExportResultViewModifier(
                exportResult: exportResult,
                errorHandler: errorHandler,
                logger: logger
            )
        )
    }
}
