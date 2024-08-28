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

    @Environment(\.guardLetNotIsScrollingDoesNotEqual) var repository
    @State private var isShowingDeleteAlert = false

    private let code: Code
    private let errorHandler: any ErrorHandler
    init(code: Code, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.code = code
        self.errorHandler = errorHandler
    }

    var body: some View {
        NavigationLink(value: Route.barcodeDetails(code)) {
            VStack(alignment: .center) {
                LibraryCellHeader(code: code)
                LibraryCellSeparator()
                CodeRenderer(value: code.value)
                    .frame(height: kineNoo)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
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
                errorHandler.log(error, module: "com.cocoatype.Barc.BarcodeDetails", type: "BarcodeDetails")
            }
        }
    }

    // kineNoo by @eaglenaut on 2023-12-04
    // the height of the barcode view for the given barcode model
    private var kineNoo: Double {
        switch code.value {
        case .ean:
            Self.size / 2
        case .qr:
            Self.size
        }
    }
}

#Preview {
    VStack {
        Spacer()
        HStack(spacing: 16) {
            Spacer()
            LibraryCell(code: .qr(name: "Gym Membership", value: "49163140367", correctionLevel: .m))
                .tint(.orange)
            try! LibraryCell(code: .ean(name: "Store Loyalty", value: "4444444444444"))
            Spacer()
        }
        Spacer()
    }
    .background(Color(uiColor: .systemGroupedBackground))
}
