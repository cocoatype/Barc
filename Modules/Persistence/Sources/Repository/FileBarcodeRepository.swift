//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftData

struct FileBarcodeRepository: BarcodeRepository {
    @MainActor var barcodes: [BarcodeModel] {
        get throws {
            let models = try modelContainer.mainContext.fetch(FetchDescriptor<BarcodePersistedModel>())
            return models.map(\.barcodeModel)
        }
    }

    @MainActor func add(_ barcode: BarcodeModel) throws {
        modelContainer.mainContext.insert(BarcodePersistedModel(barcodeModel: barcode))
        try modelContainer.mainContext.save()
    }

    private let modelContainer = {
        do {
            let modelContainer = try ModelContainer(for: BarcodePersistedModel.self)
            return modelContainer
        } catch {
            ErrorHandling.fatalError(error)
        }
    }()
}
