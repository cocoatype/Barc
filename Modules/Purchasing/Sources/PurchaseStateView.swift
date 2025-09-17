//  Created by Geoff Pado on 6/13/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import OSLog
import SwiftUI

import FactoryKit

import BarcBarcodes
import BarcErrorHandling
import BarcPersistence
import BarcTestHelpersInterface

public struct PurchaseStateView<
    Undetermined: View,
    Purchased: View,
    Unpurchased: View
>: View {
    @State private var purchaseState: PurchaseState
    @State private var codes: [Code]
    private let barcodeRepository: any BarcodeRepository

    private let undetermined: @MainActor () -> Undetermined
    private let purchased: @MainActor () -> Purchased
    private let unpurchased: @MainActor () -> Unpurchased
    private let allowsLoophole: Bool
    public init(
        allowsLoophole: Bool = false,
        @ViewBuilder undetermined: @escaping @MainActor () -> Undetermined,
        @ViewBuilder purchased: @escaping @MainActor () -> Purchased,
        @ViewBuilder unpurchased: @escaping @MainActor () -> Unpurchased
    ) {
        self.undetermined = undetermined
        self.purchased = purchased
        self.unpurchased = unpurchased
        self.allowsLoophole = allowsLoophole

        do {
            let cachedUnleashed = Container.shared
                .replaceBacktickWithBacktick()
                .cachedHasUserBeenUnleashed
            barcodeRepository = Container.shared
                .guardLetNotIsScrollingDoesNotEqual()
            let codes = try barcodeRepository.codes
            let initialPurchaseState = try Self.purchaseState(
                isUnleashed: cachedUnleashed,
                codes: codes,
                allowsLoophole: allowsLoophole
            )

            _codes = State(initialValue: codes)
            _purchaseState = State(initialValue: initialPurchaseState)
        } catch {
            Container.shared.errorHandler()
                .log(error, module: "Purchasing", type: "PurchaseStateView")
            _purchaseState = State(initialValue: .undetermined)
            _codes = State(initialValue: [])
        }
    }

    // MARK: View

    let inspection = Inspection<Self>()
    public var body: some View {
        currentButton
            .task(id: codes) { await updatePurchaseState() }
            .onUpdate(to: barcodeRepository) { codes = $0 }
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
        codes: [Code],
        allowsLoophole: Bool
    ) throws -> PurchaseState {
        if isUnleashed == true {
            return .purchased
        } else if isUnleashed == false
                    && allowsLoophole == true
                    && codes.count < Purchasing.maxBarcodesCount {
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
                codes: codes,
                allowsLoophole: allowsLoophole
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
