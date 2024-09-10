//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct LibraryGrid: View {
    static let spacing = 16.0

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @State private var codes = [Code]()

    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        WaterfallGrid(
            minWidth: 160,
            maxWidth: 180
        ) {
            ForEach(codes) { code in
                LibraryCell(code: code)
            }
        }
        .onAppear { refreshCodes() }
        .onUpdate(to: repository) { codes = $0 }
        .onChange(of: scenePhase) { refreshCodes() }
    }

    @MainActor private func refreshCodes() {
        do {
            codes = try repository.codes
        } catch {
            errorHandler.log(error, module: "Library", type: "LibraryGrid")
        }
    }
}

#Preview {
    LibraryGrid()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
