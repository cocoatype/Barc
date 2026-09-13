//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ExportResultViewModifier: ViewModifier {
    @Binding private var exportResult: ExportResult?
    init(
        exportResult: Binding<ExportResult?>
    ) {
        _exportResult = exportResult
    }

    @State private var reviewError: Error?
    func body(content: Content) -> some View {
        content
            .errorAlert(error: $exportResult.error)
            .errorAlert(error: $reviewError)
            .passReviewSheet(
                pass: $exportResult.pass,
                error: $reviewError
            )
    }
}

public extension View {
    func exportResult(
        _ exportResult: Binding<ExportResult?>
    ) -> some View {
        modifier(
            ExportResultViewModifier(
                exportResult: exportResult
            )
        )
    }
}
