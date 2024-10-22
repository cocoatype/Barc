//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import PassKit
import SwiftUI

struct PassReviewView: UIViewControllerRepresentable {
    private let pass: PKPass
    init(pass: PKPass) {
        self.pass = pass
    }

    func makeUIViewController(context: Context) -> PKAddPassesViewController {
        guard let controller = PKAddPassesViewController(pass: pass) else {
            ErrorHandling.defaultHandler.fatalError("Unknown error creating PKAddPassesViewController.")
        }

        return controller
    }

    func updateUIViewController(_ viewController: PKAddPassesViewController, context: Context) {}
}
