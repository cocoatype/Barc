//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import BarcodeEdit
import Persistence
import SwiftUI

struct CodeValueSuccessView: View {
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

    private func handle(_ code: Code?) async {
        if let code {
            do {
                try await Persistence.defaultRepository.add(code)
                extensionContext?.completeRequest(returningItems: [])
            } catch {
                extensionContext?.cancelRequest(withError: error)
            }
        } else {
            extensionContext?.completeRequest(returningItems: nil)
        }
    }
}
