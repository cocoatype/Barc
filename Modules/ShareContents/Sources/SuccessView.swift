//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import FactoryKit

import BarcAppShortcuts
import BarcBarcodes
import BarcBarcodeEdit
import BarcPersistence

struct SuccessView: View {
    @Environment(\.extensionContext) private var extensionContext

    private let value: CodeValue
    init(value: CodeValue) {
        self.value = value
    }

    var body: some View {
        NavigationStack {
            BarcodeEdit(value: value) { code in
                Task {
                    await handle(code)
                }
            }
        }
    }

    @Injected(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    private func handle(_ code: Code?) async {
        if let code {
            do {
                try repository.add(code)
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
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m)
    )
}
