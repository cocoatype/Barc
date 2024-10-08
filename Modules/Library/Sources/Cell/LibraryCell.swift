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
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .frame(height: Self.size * code.value.kineNoo)
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
    }
}

#Preview {
    VStack {
        Spacer()
        HStack(spacing: 16) {
            Spacer()
            LibraryCell(code: .qr(name: "Gym Membership", value: "49163140367", correctionLevel: .m))
            try! LibraryCell(code: .ean(name: "Store Loyalty", value: "4444444444444"))
            Spacer()
        }
        Spacer()
    }
    .background(Color(uiColor: .systemGroupedBackground))
}
