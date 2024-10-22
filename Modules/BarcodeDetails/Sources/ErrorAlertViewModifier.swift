//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct ErrorAlertViewModifier: ViewModifier {
    @Binding private var isPresented: Bool
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
    }

    func body(content: Content) -> some View {
        content.alert(Strings.title, isPresented: $isPresented) {
            Button(Strings.dismissButton) {}
        } message: {
            ErrorMessageText(Strings.message)
        }
    }

    private typealias Strings = BarcodeDetailsStrings.ErrorAlertViewModifier
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
    func errorAlert(isPresented: Binding<Bool>) -> ModifiedContent<Self, ErrorAlertViewModifier> {
        modifier(ErrorAlertViewModifier(isPresented: isPresented))
    }
}
