//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcImageReader
import BarcPersistence

struct ErrorAlertViewModifier: ViewModifier {
    @Binding private var pickerResult: PickerResult
    @Binding private var shouldDisplayAlert: Bool
    init(
        pickerResult: Binding<PickerResult>,
        shouldDisplayAlert: Binding<Bool>
    ) {
        _pickerResult = pickerResult
        _shouldDisplayAlert = shouldDisplayAlert
    }

    func body(content: Content) -> some View {
        content
            .alert(titleKey, isPresented: $shouldDisplayAlert) {
                Button(Strings.dismissButtonTitle) {
                    pickerResult = .picking
                }
            } message: {
                Text(message)
            }
    }

    var isErrorNoValueError: Bool {
        if let error = pickerResult.error,
           case PhotoLibraryItemScannerError.noValueInImage = error {
            return true
        } else { return false }
    }

    var isErrorSymbologyError: Bool {
        if let error = pickerResult.error,
           case BarcodeResultMapperError.invalidSymbology = error {
            return true
        } else { return false }
    }

    var isErrorDuplicateError: String? {
        if let error = pickerResult.error,
           case BarcodeRepositoryError.duplicateCode(let codeName) = error {
            return codeName
        } else { return nil }
    }

    var titleKey: String {
        if isErrorSymbologyError {
            return Strings.invalidSymbologyAlertTitle
        } else if isErrorDuplicateError != nil {
            return Strings.duplicateAlertTitle
        } else if isErrorNoValueError {
            return Strings.noValueAlertTitle
        } else {
            return Strings.defaultAlertTitle
        }
    }

    var message: String {
        if isErrorSymbologyError {
            return Strings.invalidSymbologyAlertMessage
        } else if let codeName = isErrorDuplicateError {
            return Strings.duplicateAlertMessage(codeName)
        } else if isErrorNoValueError {
            return Strings.noValueAlertMessage
        } else {
            return Strings.defaultAlertMessage
        }
    }

    private typealias Strings = BarcPhotoLibrary.Strings.ErrorAlertViewModifier
}

extension View {
    func errorAlert(
        for pickerResult: Binding<PickerResult>,
        shouldDisplayAlert: Binding<Bool>
    ) -> ModifiedContent<Self, ErrorAlertViewModifier> {
        self.modifier(
            ErrorAlertViewModifier(
                pickerResult: pickerResult,
                shouldDisplayAlert: shouldDisplayAlert
            )
        )
    }
}
