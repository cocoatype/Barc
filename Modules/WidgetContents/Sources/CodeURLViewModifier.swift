//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct CodeURLViewModifier: ViewModifier {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    private var widgetURL: URL? {
        let valueID = code.value.id
        guard let base64 = valueID.data(using: .utf8)?.base64EncodedString(),
              let url = URL(string: "barc:///details?codeValue=\(base64)")
        else { return nil }

        return url
    }

    func body(content: Content) -> some View {
        if let widgetURL {
            content.widgetURL(widgetURL)
        } else {
            content
        }
    }
}

extension View {
    func codeURL(_ code: Code) -> ModifiedContent<Self, CodeURLViewModifier> {
        self.modifier(CodeURLViewModifier(code: code))
    }
}
