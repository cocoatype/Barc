//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import SwiftUI
import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import BarcBarcodes
import BarcPersistenceDoubles
import BarcPurchasingDoubles
import BarcTestHelpersInterface

@testable import BarcPurchasing

@MainActor @Suite(.container)
struct PurchaseStateViewTests {
    @Test func initSetsPurchasedState() throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = true
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView()

        _ = try view.inspect().find(PurchasedView.self)
    }

    @Test func initSetsUnpurchasedState() throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = false
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView()

        _ = try view.inspect().find(UnpurchasedView.self)
    }

    @Test func initSetsUndeterminedState() throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = nil
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView()

        _ = try view.inspect().find(UndeterminedView.self)
    }

    @Test func initWithLoopholeSetsUnpurchasedState() throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = false
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView(stubAllowsLoophole: true)

        _ = try view.inspect().find(UnpurchasedView.self)
    }

    @Test func initWithLoopholeSetsPurchasedState() throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = false
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        let barcodeRepository = StubBarcodeRepository()
        barcodeRepository.codes = []
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in barcodeRepository }

        let view = PurchaseStateView(stubAllowsLoophole: true)

        _ = try view.inspect().find(PurchasedView.self)
    }

    @Test func updateSetsPurchasedState() async throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = false
        purchaseRepository.hasUserBeenUnleashedResult = .success(true)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView()
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(UnpurchasedView.self)
        try await initialView.callTask(id: [Code]())

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(PurchasedView.self)
        }
    }

    @Test func updateSetsUnpurchasedState() async throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = true
        purchaseRepository.hasUserBeenUnleashedResult = .success(false)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView()
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(PurchasedView.self)
        try await initialView.callTask(id: [Code]())

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(UnpurchasedView.self)
        }
    }

    @Test func updateWithLoopholeSetsUnpurchasedState() async throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = false
        purchaseRepository.hasUserBeenUnleashedResult = .success(false)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }

        let barcodeRepository = StubBarcodeRepository()
        let codes = barcodeRepository.codes
        barcodeRepository.codes = []
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in barcodeRepository }

        let view = PurchaseStateView(stubAllowsLoophole: true)
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(PurchasedView.self)

        barcodeRepository.codes = codes
        barcodeRepository.sendUpdates()
        try await initialView.callTask(id: barcodeRepository.codes)

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(UnpurchasedView.self)
        }
    }

    @Test func updateWithLoopholeSetsPurchasedState() async throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = false
        purchaseRepository.hasUserBeenUnleashedResult = .success(false)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }

        let barcodeRepository = StubBarcodeRepository()
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in barcodeRepository }

        let view = PurchaseStateView(stubAllowsLoophole: true)
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(UnpurchasedView.self)

        barcodeRepository.codes = []
        barcodeRepository.sendUpdates()
        try await initialView.callTask(id: barcodeRepository.codes)

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(PurchasedView.self)
        }
    }

    @Test func updateWithBadRepositorySetsUndeterminedState() async throws {
        var purchaseRepository = StubPurchaseRepository()
        purchaseRepository.cachedHasUserBeenUnleashed = true
        enum StubError: Error { case stub }
        purchaseRepository.hasUserBeenUnleashedResult = .failure(StubError.stub)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in purchaseRepository }
        Container.shared.guardLetNotIsScrollingDoesNotEqual
            .register { @MainActor in StubBarcodeRepository() }

        let view = PurchaseStateView()
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(PurchasedView.self)
        try await initialView.callTask(id: [Code]())

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(UndeterminedView.self)
        }
    }
}

fileprivate struct UndeterminedView: View {
    var body: some View { Text("Undetermined") }
}

fileprivate struct PurchasedView: View {
    var body: some View { Text("Purchased") }
}

fileprivate struct UnpurchasedView: View {
    var body: some View { Text("Unpurchased") }
}

extension PurchaseStateView {
    init(
        stubAllowsLoophole: Bool = false,
        @ViewBuilder stubUndetermined: @escaping @MainActor () -> Undetermined = { UndeterminedView() },
        @ViewBuilder stubPurchased: @escaping @MainActor () -> Purchased = { PurchasedView() },
        @ViewBuilder stubUnpurchased: @escaping @MainActor () -> Unpurchased = { UnpurchasedView() }
    ) {
        self.init(
            allowsLoophole: stubAllowsLoophole,
            undetermined: stubUndetermined,
            purchased: stubPurchased,
            unpurchased: stubUnpurchased
        )
    }
}

extension Inspection: @retroactive InspectionEmissary, @unchecked Sendable {}
