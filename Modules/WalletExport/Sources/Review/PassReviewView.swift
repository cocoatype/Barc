//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit
import SwiftUI

import BarcErrorHandling

struct PassReviewView: UIViewControllerRepresentable {
    private let pass: PKPass
    private let errorHandler: any ErrorHandler
    init(
        pass: PKPass,
        errorHandler: any ErrorHandler
    ) {
        self.pass = pass
        self.errorHandler = errorHandler
    }

    func makeUIViewController(context: Context) -> PKAddPassesViewController {
        guard let controller = PKAddPassesViewController(pass: pass) else {
            errorHandler.fatalError("Unknown error creating PKAddPassesViewController.")
        }

        return controller
    }

    func updateUIViewController(_ viewController: PKAddPassesViewController, context: Context) {}
}
