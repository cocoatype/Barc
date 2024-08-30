//  Created by Geoff Pado on 8/29/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct WatchLibraryView: View {
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @State private var codes = [Code]()

    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        List(codes) { code in
            WatchLibraryCell(code: code)
        }
        .onAppear {
            do {
                codes = try repository.codes
            } catch {
                errorHandler.log(error, module: "com.cocoatype.Barc.Library", type: "LibraryGrid")
            }
        }
    }
}

#Preview {
    WatchLibraryView()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
