//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct LibraryGrid: View {
    static let spacing = 16.0

    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    @State private var barcodes = [BarcodeModel]()

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: LibraryCell.size, maximum: LibraryCell.size), spacing: Self.spacing)], spacing: Self.spacing) {
            ForEach(barcodes) { barcode in
                LibraryCell(barcode: barcode)
            }
        }.onAppear {
            do {
                barcodes = try repository.barcodes
            } catch {
                ErrorHandling.log(error, subsystem: "com.cocoatype.Barc.Library", category: "LibraryGrid")
            }
        }
    }
}

#Preview {
    LibraryGrid()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
