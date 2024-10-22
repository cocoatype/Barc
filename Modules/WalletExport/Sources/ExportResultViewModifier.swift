//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import Unpurchased

struct ExportResultViewModifier: ViewModifier {
    @Binding private var exportResult: ExportResult?
    init(exportResult: Binding<ExportResult?>) {
        _exportResult = exportResult
    }

    func body(content: Content) -> some View {
        content
            .errorAlert(error: $exportResult.error)
            .passReviewSheet(pass: $exportResult.pass)
            .unpurchasedAlert(for: .walletExport, isPresented: $exportResult.isUnpurchased)

    }
}

public extension View {
    func exportResult(_ exportResult: Binding<ExportResult?>) -> some View {
        modifier(ExportResultViewModifier(exportResult: exportResult))
    }
}
