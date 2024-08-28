//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

struct DeleteButton: View {
    private let code: Code
    private let deleteAction: (Code) -> Void
    init(code: Code, deleteAction: @escaping (Code) -> Void) {
        self.code = code
        self.deleteAction = deleteAction
    }

    var body: some View {
        Button(BarcodeEditStrings.DeleteButton.title, role: .destructive) {
            deleteAction(code)
        }
    }
}
