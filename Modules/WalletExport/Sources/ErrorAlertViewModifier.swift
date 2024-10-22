//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ErrorAlertViewModifier: ViewModifier {
    @Binding private var error: (any Error)?
    private let isPresented: Binding<Bool>
    init(error: Binding<(any Error)?>) {
        _error = error

        isPresented = Binding {
            error.wrappedValue != nil
        } set: { newValue in
            if newValue == false {
                error.wrappedValue = nil
            }
        }
    }

    func body(content: Content) -> some View {
        content.alert(Strings.title, isPresented: isPresented) {
            Button(Strings.dismissButton) {}
        } message: {
            ErrorMessageText(Strings.message)
        }
    }

    private typealias Strings = WalletExportStrings.ErrorAlertViewModifier
}

struct ErrorMessageText: View {
    private let string: String
    init(_ string: String) {
        self.string = string
    }

    var attributedString: AttributedString {
        do {
            var baseString = try AttributedString(markdown: string)
            baseString.runs
                .filter { $0.link != nil }
                .forEach { run in
                    baseString[run.range].underlineStyle = .init(pattern: .solid)
                }
            return baseString
        } catch {
            return AttributedString(string)
        }
    }

    var body: some View {
        Text(attributedString)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func errorAlert(error: Binding<(any Error)?>) -> ModifiedContent<Self, ErrorAlertViewModifier> {
        modifier(ErrorAlertViewModifier(error: error))
    }
}
