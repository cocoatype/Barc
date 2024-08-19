//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftData

@MainActor struct FileBarcodeRepository: BarcodeRepository {
    nonisolated init() {}

    var codes: [Code] {
        get throws {
            return try models.map { try mapper.code(from: $0) }
        }
    }

    private var models: [BarcodeModel] {
        get throws {
            try modelContainer.mainContext.fetch(FetchDescriptor<BarcodeModel>())
        }
    }

    private func findModel(for code: Code) throws -> BarcodeModel? {
        return try models.first(where: { model in
            let modelCode = try mapper.code(from: model)
            return modelCode.value == code.value
        })
    }

    private func model(for code: Code) throws -> BarcodeModel {
        if let model = try findModel(for: code) {
            return model
        } else { return try insertModel(for: code) }
    }

    private let watcher = RepositoryWatcher()
    @discardableResult private func insertModel(for code: Code) throws -> BarcodeModel {
        let model = mapper.barcodeModel(from: code)
        modelContainer.mainContext.insert(model)
        try modelContainer.mainContext.save()
        return model
    }

    func add(_ code: Code) throws {
        try insertModel(for: code)
        try watcher.updateSubscribers(with: codes)
    }

    func update(_ code: Code) throws {
        let model = try model(for: code)
        mapper.update(model, from: code)
        try modelContainer.mainContext.save()
        try watcher.updateSubscribers(with: codes)
    }

    func subscribeToUpdates() -> AsyncStream<[Code]> {
        return watcher.newSubscriber()
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
