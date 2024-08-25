//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ImageReader
import SwiftUI

struct ErrorAlertViewModifier: ViewModifier {
    @Binding private var scanResult: ScanResult
    init(scanResult: Binding<ScanResult>) {
        _scanResult = scanResult
    }

    func body(content: Content) -> some View {
        content
            .alert(titleKey, isPresented: $scanResult.hasError) {
                Button(Strings.dismissButtonTitle) {
                    scanResult = .scanning
                }
            } message: {
                Text(message)
            }
    }

    var isErrorSymbologyError: Bool {
        if let error = scanResult.error,
           case BarcodeResultMapperError.invalidSymbology = error {
            return true
        } else { return false }
    }

    var titleKey: String {
        if isErrorSymbologyError {
            return Strings.invalidSymbologyAlertTitle
        } else {
            return Strings.defaultAlertTitle
        }
    }

    var message: String {
        if isErrorSymbologyError {
            return Strings.invalidSymbologyAlertMessage
        } else {
            return Strings.defaultAlertTitle
        }
    }

    private typealias Strings = ScannerStrings.ErrorAlertViewModifier
}

extension View {
    func errorAlert(for scanResult: Binding<ScanResult>) -> ModifiedContent<Self, ErrorAlertViewModifier> {
        self.modifier(ErrorAlertViewModifier(scanResult: scanResult))
    }
}
