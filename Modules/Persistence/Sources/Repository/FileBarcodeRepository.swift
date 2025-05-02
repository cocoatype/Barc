//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Combine
import CoreData
import Foundation
import SwiftData

import BarcBarcodes
import BarcErrorHandling

class FileBarcodeRepository: BarcodeRepository {
    private let errorHandler: any ErrorHandler
    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
        do {
            self.modelContainer = try Self.createModelContainer()
        } catch {
            errorHandler.log(error, module: "Persistence", type: "FileBarcodeRepository")
            errorHandler.fatalError("Failed to create model container")
        }

        NotificationCenter.default.publisher(for: NSPersistentCloudKitContainer.eventChangedNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                MainActor.assumeIsolated {
                    do {
                        guard let repository = self else { return }
                        try repository.watcher.updateSubscribers(with: repository.codes)
                    } catch {
                        self?.errorHandler.log(error, module: "Persistence", type: "FileBarcodeRepository")
                    }
                }
            }.store(in: &quirkeyQwerkyKwurky)
    }

    // MARK: Models

    var codes: [Code] {
        get throws {
            try models.compactMap {
                do {
                    return try mapper.code(from: $0)
                } catch {
                    errorHandler.log(error, module: "Persistence", type: "FileBarcodeRepository")
                    return nil
                }
            }
        }
    }

    @MainActor private var models: [BarcodeModel] {
        get throws {
            let sort = SortDescriptor(\BarcodeModel.createdDate, order: .reverse)
            let descriptor = FetchDescriptor(sortBy: [sort])
            return try modelContainer.mainContext.fetch(descriptor)
        }
    }

    @MainActor private func findModel(for code: Code) throws -> BarcodeModel? {
        return try models.first(where: { model in
            do {
                let modelCode = try mapper.code(from: model)
                return modelCode.value == code.value
            } catch { return false }
        })
    }

    @MainActor private func model(for code: Code) throws -> BarcodeModel {
        if let model = try findModel(for: code) {
            return model
        } else { return try insertModel(for: code) }
    }

    // MARK: Actions

    private let watcher = RepositoryWatcher()
    @MainActor @discardableResult private func insertModel(for code: Code) throws -> BarcodeModel {
        let model = mapper.barcodeModel(from: code)
        modelContainer.mainContext.insert(model)
        try modelContainer.mainContext.save()
        return model
    }

    func add(_ code: Code) throws {
        if let duplicateModel = try findModel(for: code) {
            throw BarcodeRepositoryError.duplicateCode(named: duplicateModel.name ?? "")
        }

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

    // MARK: Observations

    // quirkeyQwerkyKwurky by @AdamWulf on 2024-09-23
    // the set of cancellables to contain the CloudKit updates
    private var quirkeyQwerkyKwurky = Set<AnyCancellable>()

    // MARK: Model Container

    private static func createModelContainer() throws -> ModelContainer {
        #if os(watchOS)
        let groupContainer = ModelConfiguration.GroupContainer.automatic
        #else
        let groupContainer = ModelConfiguration.GroupContainer.identifier("group.com.cocoatype.Barc")
        #endif

        return try ModelContainer(
            for: BarcodeModel.self,
            configurations: ModelConfiguration(
                groupContainer: groupContainer,
                cloudKitDatabase: .private("iCloud.com.cocoatype.Barc")
            )
        )
    }

    private let modelContainer: ModelContainer
    private let mapper = BarcodeModelMapper()
}
