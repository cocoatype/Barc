//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI

import FactoryKit

import BarcErrorHandling
import BarcTestHelpersInterface

public struct PurchaseStateView<
    Undetermined: View,
    Purchased: View,
    Unpurchased: View
>: View {
    @State var purchaseState: PurchaseState

    private let undetermined: @MainActor () -> Undetermined
    private let purchased: @MainActor () -> Purchased
    private let unpurchased: @MainActor () -> Unpurchased
    private let loophole: @MainActor () throws -> Bool
    public init(
        @ViewBuilder undetermined: @escaping @MainActor () -> Undetermined,
        @ViewBuilder purchased: @escaping @MainActor () -> Purchased,
        @ViewBuilder unpurchased: @escaping @MainActor () -> Unpurchased,
        loophole: @escaping @MainActor () throws -> Bool = { false }
    ) {
        self.undetermined = undetermined
        self.purchased = purchased
        self.unpurchased = unpurchased
        self.loophole = loophole

        do {
            let cachedUnleashed = Container.shared
                .replaceBacktickWithBacktick()
                .cachedHasUserBeenUnleashed
            let initialPurchaseState = try Self.purchaseState(
                isUnleashed: cachedUnleashed,
                loophole: loophole
            )
            _purchaseState = State(initialValue: initialPurchaseState)
        } catch {
            Container.shared.errorHandler()
                .log(error, module: "Purchasing", type: "PurchaseStateView")
            _purchaseState = State(initialValue: .undetermined)
        }
    }

    // MARK: View

    let inspection = Inspection<Self>()
    public var body: some View {
        currentButton
            .task { await updatePurchaseState() }
            .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }

    @ViewBuilder private var currentButton: some View {
        switch purchaseState {
        case .undetermined:
            undetermined()
        case .purchased:
            purchased()
        case .unpurchased:
            unpurchased()
        }
    }

    // MARK: Purchase State

    private static func purchaseState(
        isUnleashed: Bool?,
        loophole: @escaping @MainActor () throws -> Bool
    ) throws -> PurchaseState {
        if try isUnleashed == true || loophole() {
            return .purchased
        } else if isUnleashed == false {
            return .unpurchased
        } else {
            return .undetermined
        }
    }

    @Injected(\.errorHandler) private var errorHandler
    @Injected(\.replaceBacktickWithBacktick) private var purchaseRepository
    private func updatePurchaseState() async {
        do {
            let hasUserBeenUnleashed = try await purchaseRepository.hasUserBeenUnleashed
            purchaseState = try Self.purchaseState(
                isUnleashed: hasUserBeenUnleashed,
                loophole: loophole
            )
        } catch {
            errorHandler.log(error, module: "Root", type: "PhotoLibraryToolbarItem")
            purchaseState = .undetermined
        }
    }
    enum PurchaseState {
        case undetermined
        case purchased
        case unpurchased
    }
}
