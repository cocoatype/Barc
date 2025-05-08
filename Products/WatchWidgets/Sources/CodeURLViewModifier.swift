//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct CodeURLViewModifier: ViewModifier {
    private let codeID: String
    init(codeID: String) {
        self.codeID = codeID
    }

    private var widgetURL: URL? {
        guard codeID.isEmpty == false,
              let base64 = codeID.data(using: .utf8)?.base64EncodedString(),
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
    func codeURL(_ codeID: String) -> ModifiedContent<Self, CodeURLViewModifier> {
        self.modifier(CodeURLViewModifier(codeID: codeID))
    }
}
