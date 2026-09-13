//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcBarcodes
import BarcPersistence
import BarcRouting

struct ManualEntryToolbarItem: View {
    nonisolated static let systemImage = "plus"

    @Binding private var sheetRoute: Route?
    private let barcodeRepository: any BarcodeRepository
    init(value: Binding<Route?>) {
        _sheetRoute = value
        barcodeRepository = Container.shared.guardLetNotIsScrollingDoesNotEqual()
        do {
            codes = try barcodeRepository.codes
        } catch {
            codes = []
        }
    }

    @State private var codes: [Code]
    var body: some View {
        ManualEntryPresentingButton(presenting: $sheetRoute)
            .onUpdate(to: barcodeRepository) { codes = $0 }
    }
}

#Preview {
    ManualEntryToolbarItem(
        value: .constant(nil)
    )
}
