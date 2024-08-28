//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftData

struct FileBarcodeRepository: BarcodeRepository {
    private let errorHandler: any ErrorHandler
    nonisolated init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler
        do {
            self.modelContainer = try Self.createModelContainer()
        } catch {
            errorHandler.log(error, module: "com.cocoatype.Barc.Persistence", type: "FileBarcodeRepository")
            errorHandler.fatalError("Failed to create model container")
        }
    }

    var codes: [Code] {
        get throws {
            return try models.compactMap {
                do {
                    return try mapper.code(from: $0)
                } catch {
                    errorHandler.log(error, module: "com.cocoatype.Barc.Persistence", type: "FileBarcodeRepository")
                    return nil
                }
            }
        }
    }

    @MainActor private var models: [BarcodeModel] {
        get throws {
            try modelContainer.mainContext.fetch(FetchDescriptor<BarcodeModel>())
        }
    }

    @MainActor private func findModel(for code: Code) throws -> BarcodeModel? {
        return try models.first(where: { model in
            let modelCode = try mapper.code(from: model)
            return modelCode.value == code.value
        })
    }

    @MainActor private func model(for code: Code) throws -> BarcodeModel {
        if let model = try findModel(for: code) {
            return model
        } else { return try insertModel(for: code) }
    }

    private let watcher = RepositoryWatcher()
    @MainActor @discardableResult private func insertModel(for code: Code) throws -> BarcodeModel {
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

    func delete(_ code: Code) throws {
        let model = try model(for: code)
        try modelContainer.mainContext.transaction {
            modelContainer.mainContext.delete(model)
        }
        try watcher.updateSubscribers(with: codes)
    }

    func subscribeToUpdates() -> AsyncStream<[Code]> {
        return watcher.newSubscriber()
    }

    nonisolated private static func createModelContainer() throws -> ModelContainer {
        return try ModelContainer(
            for: BarcodeModel.self,
            configurations: ModelConfiguration(
                groupContainer: .identifier("group.com.cocoatype.Barc"),
                cloudKitDatabase: .private("iCloud.com.cocoatype.Barc")
            )
        )
    }

    private let modelContainer: ModelContainer
    private let mapper = BarcodeModelMapper()
}
