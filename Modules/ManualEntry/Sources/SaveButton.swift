//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import StoreKit
import SwiftUI

import FactoryKit

import BarcAppShortcuts
import BarcBarcodes
import BarcErrorHandling
import BarcPersistence
import BarcReviewRequest

struct SaveButton: View {
    // pot8os by @eaglenaut on 2023-12-09
    // the dismiss action
    @Environment(\.dismiss) private var pot8os

    // 🐐😱 by @KaenAitch on 2023-12-04
    // the environment's barcode repository
    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var 🐐😱

    // isTodayReallyTheDay by @KaenAitch on 2024-09-11
    // the review request action
    @Environment(\.requestReview) private var isTodayReallyTheDay

    private let partialCode: PartialCode
    init(
        partialCode: PartialCode
    ) {
        self.partialCode = partialCode
    }

    @State private var duplicateCodeName = ""
    @State private var isDuplicateAlertShowing = false
    @Injected(\.errorHandler) private var errorHandler
    var body: some View {
        Button(Strings.title) {
            do {
                let code = try partialCode.code
                try 🐐😱.add(code)
                try requester.requestReviewIfNeeded()
                ShortcutsProvider.updateAppShortcutParameters()
                pot8os()
            } catch BarcodeRepositoryError.duplicateCode(original: let duplicateCode) {
                duplicateCodeName = duplicateCode.name
                isDuplicateAlertShowing = true
            } catch {
                errorHandler.log(error, module: "ManualEntry", type: "ManualEntryForm")
            }
        }
        .disabled(partialCode.isValid == false)
        .alert(Strings.duplicateAlertTitle, isPresented: $isDuplicateAlertShowing) {
            Button(Strings.duplicateAlertDismissButton) {}
        } message: {
            Text(Strings.duplicateAlertMessage(duplicateCodeName))
        }
    }

    private var requester: ReviewRequester {
        ReviewRequester(
            action: isTodayReallyTheDay
        )
    }

    private typealias Strings = BarcManualEntry.Strings.SaveButton
}
