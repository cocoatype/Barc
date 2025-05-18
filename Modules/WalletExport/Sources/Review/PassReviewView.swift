//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit
import SwiftUI

import FactoryKit

import BarcErrorHandling

struct PassReviewView: UIViewControllerRepresentable {
    private let pass: PKPass
    init(
        pass: PKPass
    ) {
        self.pass = pass
    }

    @Injected(\.errorHandler) private var errorHandler
    func makeUIViewController(context: Context) -> PKAddPassesViewController {
        guard let controller = PKAddPassesViewController(pass: pass) else {
            errorHandler.fatalError("Unknown error creating PKAddPassesViewController.")
        }

        return controller
    }

    func updateUIViewController(_ viewController: PKAddPassesViewController, context: Context) {}
}
