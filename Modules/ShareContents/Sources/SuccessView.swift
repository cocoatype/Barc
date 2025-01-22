//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import AppShortcuts
import Barcodes
import BarcodeEdit
import ErrorHandling
import Persistence
import SwiftUI

struct SuccessView: View {
    @Environment(\.extensionContext) private var extensionContext

    private let value: CodeValue
    private let errorHandler: any ErrorHandler
    init(value: CodeValue, errorHandler: any ErrorHandler) {
        self.value = value
        self.errorHandler = errorHandler
    }

    var body: some View {
        NavigationStack {
            BarcodeEdit(value: value, errorHandler: errorHandler) { code in
                Task {
                    await handle(code)
                }
            }
        }
    }

    private func handle(_ code: Code?) async {
        if let code {
            do {
                try Persistence.guardLetNotIsScrollingDoesNotEqual.add(code)
                ShortcutsProvider.updateAppShortcutParameters()
                extensionContext?.completeRequest(returningItems: [])
            } catch {
                extensionContext?.cancelRequest(withError: error)
            }
        } else {
            extensionContext?.completeRequest(returningItems: nil)
        }
    }
}

#Preview {
    SuccessView(
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m),
        errorHandler: PreviewErrorHandler()
    )
}
