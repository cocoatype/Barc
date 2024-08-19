//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct LibraryGrid: View {
    static let spacing = 16.0

    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @State private var codes = [Code]()

    var body: some View {
        WaterfallGrid(
            minWidth: 160,
            maxWidth: 180,
            spacing: Self.spacing
        ) {
            ForEach(codes) { code in
                LibraryCell(code: code)
            }
        }
        .onAppear {
            do {
                codes = try repository.codes
            } catch {
                ErrorHandling.log(error, subsystem: "com.cocoatype.Barc.Library", category: "LibraryGrid")
            }
        }
        .onUpdate(to: repository) { codes = $0 }
    }
}

#Preview {
    LibraryGrid()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
