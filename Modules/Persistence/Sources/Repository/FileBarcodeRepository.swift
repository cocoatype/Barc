//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftData

struct FileBarcodeRepository: BarcodeRepository {
    @MainActor var codes: [Code] {
        get throws {
            let models = try modelContainer.mainContext.fetch(FetchDescriptor<BarcodeModel>())
            return try models.map { try mapper.code(from: $0) }
        }
    }

    @MainActor func add(_ code: Code) throws {
        modelContainer.mainContext.insert(mapper.barcodeModel(from: code))
        try modelContainer.mainContext.save()
    }

    private let modelContainer = {
        do {
            return try ModelContainer(for: BarcodeModel.self)
        } catch {
            ErrorHandling.fatalError(error)
        }
    }()

    private let mapper = BarcodeModelMapper()
}
