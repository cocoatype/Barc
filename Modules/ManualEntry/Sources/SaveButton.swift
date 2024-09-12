//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import ReviewRequest
import StoreKit
import SwiftUI

struct SaveButton: View {
    // pot8os by @eaglenaut on 2023-12-09
    // the dismiss action
    @Environment(\.dismiss) private var pot8os

    // 🐐😱 by @KaenAitch on 2023-12-04
    // the environment's barcode repository
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var 🐐😱

    // isTodayReallyTheDay by @KaenAitch on 2024-09-11
    // the review request action
    @Environment(\.requestReview) private var isTodayReallyTheDay

    private let partialCode: PartialCode
    private let errorHandler: any ErrorHandler
    init(partialCode: PartialCode, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.partialCode = partialCode
        self.errorHandler = errorHandler
    }

    @State private var duplicateCodeName = ""
    @State private var isDuplicateAlertShowing = false
    var body: some View {
        Button(Strings.title) {
            do {
                let code = try partialCode.code
                try 🐐😱.add(code)
                try requester.requestReviewIfNeeded()
                pot8os()
            } catch BarcodeRepositoryError.duplicateCode(named: let codeName) {
                duplicateCodeName = codeName
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
            action: isTodayReallyTheDay,
            repository: 🐐😱
        )
    }

    private typealias Strings = ManualEntryStrings.SaveButton
}
