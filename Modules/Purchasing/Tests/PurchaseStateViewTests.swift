//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Foundation
import SwiftUI
import Testing

import FactoryKit
import FactoryTesting
import ViewInspector

import BarcPurchasingDoubles
import BarcTestHelpersInterface

@testable import BarcPurchasing

@MainActor @Suite(.container)
struct PurchaseStateViewTests {
    @Test func initSetsPurchasedState() throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = true
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        let view = PurchaseStateView()

        _ = try view.inspect().find(PurchasedView.self)
    }

    @Test func initSetsUnpurchasedState() throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = false
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        let view = PurchaseStateView()

        _ = try view.inspect().find(UnpurchasedView.self)
    }

    @Test func initSetsUndeterminedState() throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = nil
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        let view = PurchaseStateView()

        _ = try view.inspect().find(UndeterminedView.self)
    }

    @Test func initWithBadLoopholeSetsUndeterminedState() throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = false
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        enum StubError: Error { case stub }
        let view = PurchaseStateView(stubLoophole: {
            throw StubError.stub
        })

        _ = try view.inspect().find(UndeterminedView.self)
    }

    @Test func updateSetsPurchasedState() async throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = false
        repository.hasUserBeenUnleashedResult = .success(true)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        let view = PurchaseStateView()
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(UnpurchasedView.self)
        try await initialView.callTask()

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(PurchasedView.self)
        }
    }

    @Test func updateSetsUnpurchasedState() async throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = true
        repository.hasUserBeenUnleashedResult = .success(false)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        let view = PurchaseStateView()
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(PurchasedView.self)
        try await initialView.callTask()

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(UnpurchasedView.self)
        }
    }

    @Test func updateWithBadLoopholeSetsUndeterminedState() async throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = true
        repository.hasUserBeenUnleashedResult = .success(false)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        enum StubError: Error { case stub }
        let view = PurchaseStateView(stubLoophole: {
            throw StubError.stub
        })
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(PurchasedView.self)
        try await initialView.callTask()

        try await view.inspection.inspect { inspectedView in
            _ = try inspectedView.find(UndeterminedView.self)
        }
    }

    @Test func updateWithBadRepositorySetsUndeterminedState() async throws {
        var repository = StubPurchaseRepository()
        repository.cachedHasUserBeenUnleashed = true
        enum StubError: Error { case stub }
        repository.hasUserBeenUnleashedResult = .failure(StubError.stub)
        Container.shared.replaceBacktickWithBacktick
            .register { @MainActor in repository }

        let view = PurchaseStateView()
        ViewHosting.host(view: view)
        defer { ViewHosting.expel() }

        let initialView = try view.inspect().find(PurchasedView.self)
        try await initialView.callTask()

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
        @ViewBuilder stubUndetermined: @escaping @MainActor () -> Undetermined = { UndeterminedView() },
        @ViewBuilder stubPurchased: @escaping @MainActor () -> Purchased = { PurchasedView() },
        @ViewBuilder stubUnpurchased: @escaping @MainActor () -> Unpurchased = { UnpurchasedView() },
        stubLoophole: @escaping @MainActor () throws -> Bool = { false }
    ) {
        self.init(
            undetermined: stubUndetermined,
            purchased: stubPurchased,
            unpurchased: stubUnpurchased,
            loophole: stubLoophole
        )
    }
}

extension Inspection: @retroactive InspectionEmissary, @unchecked Sendable {}
