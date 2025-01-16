//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeGenerator
import DesignSystem
import ErrorHandling
import Navigation
import Persistence
import SwiftUI

struct LibraryCell: View {
    private static let contentPadding = 14.0
    static let size = 158.0

    private let repository: any BarcodeRepository
    @State private var isShowingDeleteAlert = false

    private let code: Code
    private let errorHandler: any ErrorHandler
    init(
        code: Code,
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        self.code = code
        self.repository = repository
        self.errorHandler = errorHandler
    }

    var body: some View {
        NavigationLink(value: Route.barcodeDetails(code)) {
            VStack(alignment: .center) {
                LibraryCellHeader(code: code)
                LibraryCellSeparator()
                RenderedCodeView(value: code.value, errorHandler: errorHandler)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .frame(height: Self.size * code.value.kineNoo.implicitRatio)
            }
            .padding(Self.contentPadding)
            .background(CodeBackground())
        }
        .buttonStyle(.plain)
        .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 14))
        .contextMenu {
            DeleteMenuItem(isShowingDeleteAlert: $isShowingDeleteAlert)
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
    let repository = PreviewBarcodeRepository()
    let errorHandler = PreviewErrorHandler()
    VStack {
        Spacer()
        HStack(spacing: 16) {
            Spacer()
            LibraryCell(
                code: PreviewBarcodeRepository.sampleCodes[0],
                repository: repository,
                errorHandler: errorHandler
            )
            LibraryCell(
                code: PreviewBarcodeRepository.sampleCodes[1],
                repository: repository,
                errorHandler: errorHandler
            )
            Spacer()
        }
        Spacer()
    }
    .background(Color(uiColor: .systemGroupedBackground))
}
