//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct DeleteAlertViewModifier: ViewModifier {
    @Binding private var isPresented: Bool

    private let code: Code
    private let deleteAction: (Code) -> Void

    init(code: Code, isPresented: Binding<Bool>, deleteAction: @escaping (Code) -> Void) {
        self.code = code
        _isPresented = isPresented
        self.deleteAction = deleteAction
    }

    func body(content: Content) -> some View {
        content.alert(Strings.title(code.name), isPresented: $isPresented) {
            Button(Strings.confirmButtonTitle, role: .destructive) {
                deleteAction(code)
            }
            Button(Strings.cancelButtonTitle, role: .cancel) {}
        }
    }

    private typealias Strings = LibraryStrings.DeleteAlertViewModifier
}

extension View {
    func deleteAlert(
        code: Code,
        isPresented: Binding<Bool>,
        deleteAction: @escaping (Code) -> Void
    ) -> ModifiedContent<Self, DeleteAlertViewModifier> {
        self.modifier(DeleteAlertViewModifier(code: code, isPresented: isPresented, deleteAction: deleteAction))
    }
}
