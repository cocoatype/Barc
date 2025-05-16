//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

import BarcErrorHandling
import BarcLogging
import BarcShareContents

class ShareViewController: UIHostingController<AnyView> {
    private let errorHandler: any ErrorHandler
    @objc init(nibName: String?, bundle: Bundle?) {
        let logger = Logging.logger
        self.errorHandler = ErrorHandling.defaultHandler(logger: logger)
        super.init(rootView: AnyView(ShareView(errorHandler: errorHandler)))
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        let typeName = NSStringFromClass(type(of: self))
        fatalError("\(typeName) does not implement init(coder:)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let newRoot = ShareView(errorHandler: errorHandler)
            .environment(\.extensionContext, extensionContext)
        rootView = AnyView(newRoot)
    }
}
