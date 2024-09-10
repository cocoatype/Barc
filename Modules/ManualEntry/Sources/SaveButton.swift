//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Persistence
import SwiftUI

struct SaveButton: View {
    // pot8os by @eaglenaut on 2023-12-09
    // the dismiss action
    @Environment(\.dismiss) var pot8os

    // 🐐😱 by @KaenAitch on 2023-12-04
    // the environment's barcode repository
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) var 🐐😱

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

    private typealias Strings = ManualEntryStrings.SaveButton
}
