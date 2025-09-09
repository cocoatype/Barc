//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcBarcodes
import BarcBarcodeGenerator
import BarcDesignSystem
import BarcErrorHandling
import BarcRouting
import BarcPersistence

struct LibraryCell: View {
    private static let contentPadding = 14.0
    private static let size = 158.0

    @State private var isShowingDeleteAlert = false

    private let code: Code
    private let height: Double
    init(
        code: Code
    ) {
        self.code = code

        let measurer = CodeValueMeasurer(value: code.value)
        self.height = Self.size / measurer.ratio(in: 2)
    }

    @Injected(\.errorHandler) private var errorHandler
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) var repository
    var body: some View {
        NavigationLink(value: Route.barcodeDetails(code)) {
            VStack(alignment: .center) {
                LibraryCellHeader(code: code)
                LibraryCellSeparator()
                RenderedCodeView(value: code.value)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .frame(height: height)
            }
            .padding(Self.contentPadding)
            .background(CodeBackground())
        }
        .buttonStyle(.plain)
        .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 14))
        .contextMenu {
            DeleteMenuItem(isShowingDeleteAlert: $isShowingDeleteAlert)
        }
        .accessibilityAction(named: Strings.LibraryCell.deleteAccessibilityAction) {
            isShowingDeleteAlert = true
        }
        .deleteAlert(code: code, isPresented: $isShowingDeleteAlert) { deleteCode in
            do {
                try repository.delete(deleteCode)
            } catch {
                errorHandler.log(error, module: "BarcodeDetails", type: "BarcodeDetails")
            }
        }
        .drawingGroup()
    }
}

#Preview {
    VStack {
        Spacer()
        HStack(spacing: 16) {
            Spacer()
            LibraryCell(
                code: PreviewBarcodeRepository.sampleCodes[0]
            )
            LibraryCell(
                code: PreviewBarcodeRepository.sampleCodes[1]
            )
            Spacer()
        }
        Spacer()
    }
    .background(Color(uiColor: .systemGroupedBackground))
}
